<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="家属姓名" prop="familyName">
          <el-input
            v-model="queryParams.familyName"
            placeholder="请输入家属姓名"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="老人姓名" prop="elderlyName">
          <el-input
            v-model="queryParams.elderlyName"
            placeholder="请输入老人姓名"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="发送者类型" prop="senderType">
          <el-select v-model="queryParams.senderType" placeholder="请选择发送者类型" clearable>
            <el-option label="家属" value="family" />
            <el-option label="护理人员" value="staff" />
          </el-select>
        </el-form-item>
        <el-form-item label="是否已读" prop="isRead">
          <el-select v-model="queryParams.isRead" placeholder="请选择是否已读" clearable>
            <el-option label="未读" value="0" />
            <el-option label="已读" value="1" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
  
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['website:communication:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['website:communication:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['website:communication:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['website:communication:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <!-- 对话记录列表 -->
      <el-table v-loading="loading" :data="communicationList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="家属姓名" align="center" prop="familyName" width="100" />
        <el-table-column label="老人姓名" align="center" prop="elderlyName" width="100" />
        <el-table-column label="对话内容" align="center" min-width="300">
          <template slot-scope="scope">
            <div class="conversation-content">
              <!-- 按时间顺序显示所有消息 -->
              <div v-for="message in scope.row.messages" :key="message.messageId" class="message-item" :class="message.senderType === 'family' ? 'family-message' : 'staff-message'">
                <el-tag size="mini" :type="message.senderType === 'family' ? 'primary' : 'success'">
                  {{ message.senderType === 'family' ? '家属' : '护理' }}
                </el-tag>
                <span class="message-text">{{ message.content }}</span>
                <span class="message-time">{{ parseTime(message.sendTime, '{m}-{d} {h}:{i}') }}</span>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="开始时间" align="center" prop="startTime" width="120">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.startTime, '{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="最后时间" align="center" prop="lastTime" width="120">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.lastTime, '{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="消息数量" align="center" width="80">
          <template slot-scope="scope">
            <el-tag size="mini">{{ scope.row.messages.length }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="已读状态" align="center" prop="isRead" width="100">
          <template slot-scope="scope">
            <el-tag :type="scope.row.isRead === '1' ? 'success' : 'warning'">
              {{ scope.row.isRead === '1' ? '已读' : '未读' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-view"
              @click="handleView(scope.row)"
              v-hasPermi="['website:communication:query']"
            >查看</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-chat-dot-round"
              @click="handleReply(scope.row)"
              v-hasPermi="['website:communication:edit']"
              v-if="scope.row.familyMessages.length > 0"
            >处理对话</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['website:communication:remove']"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
  
      <!-- 添加或修改网站沟通消息对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
          <el-form-item label="家属ID" prop="familyId">
            <el-input v-model="form.familyId" placeholder="请输入家属ID" />
          </el-form-item>
          <el-form-item label="老人ID" prop="elderlyId">
            <el-input v-model="form.elderlyId" placeholder="请输入老人ID" />
          </el-form-item>
          <el-form-item label="发送者类型" prop="senderType">
            <el-select v-model="form.senderType" placeholder="请选择发送者类型">
              <el-option label="家属" value="family" />
              <el-option label="护理人员" value="staff" />
            </el-select>
          </el-form-item>
          <el-form-item label="发送者姓名" prop="senderName">
            <el-input v-model="form.senderName" placeholder="请输入发送者姓名" />
          </el-form-item>
          <el-form-item label="消息内容" prop="content">
            <el-input v-model="form.content" type="textarea" placeholder="请输入消息内容" />
          </el-form-item>
          <el-form-item label="是否已读" prop="isRead">
            <el-select v-model="form.isRead" placeholder="请选择是否已读">
              <el-option label="未读" value="0" />
              <el-option label="已读" value="1" />
            </el-select>
          </el-form-item>
          <el-form-item label="消息类型" prop="messageType">
            <el-select v-model="form.messageType" placeholder="请选择消息类型">
              <el-option label="文本" value="text" />
              <el-option label="图片" value="image" />
              <el-option label="文件" value="file" />
            </el-select>
          </el-form-item>
          <el-form-item label="状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择状态">
              <el-option label="正常" value="0" />
              <el-option label="停用" value="1" />
            </el-select>
          </el-form-item>
          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
  
      <!-- 查看对话详情对话框 -->
      <el-dialog title="对话详情" :visible.sync="viewDialogVisible" width="700px" append-to-body>
        <div class="conversation-detail">
          <div class="conversation-info">
            <h4>对话信息</h4>
            <p><strong>家属：</strong>{{ currentMessage.familyName }}</p>
            <p><strong>老人：</strong>{{ currentMessage.elderlyName }}</p>
            <p><strong>对话日期：</strong>{{ currentMessage.conversationDate }}</p>
            <p><strong>开始时间：</strong>{{ parseTime(currentMessage.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</p>
            <p><strong>最后时间：</strong>{{ parseTime(currentMessage.lastTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</p>
            <p><strong>消息数量：</strong>{{ currentMessage.messages ? currentMessage.messages.length : 0 }} 条</p>
            <p><strong>已读状态：</strong>
              <el-tag :type="currentMessage.isRead === '1' ? 'success' : 'warning'">
                {{ currentMessage.isRead === '1' ? '已读' : '未读' }}
              </el-tag>
            </p>
          </div>
          
          <div class="conversation-messages">
            <h4>对话内容</h4>
            <!-- 按时间顺序显示所有消息 -->
            <div v-for="message in currentMessage.messages" :key="message.messageId" class="message-item" :class="message.senderType === 'family' ? 'family-message' : 'staff-message'">
              <div class="message-header">
                <el-tag size="mini" :type="message.senderType === 'family' ? 'primary' : 'success'">
                  {{ message.senderType === 'family' ? '家属' : '护理人员' }}
                </el-tag>
                <span class="sender-name">{{ message.senderName }}</span>
                <span class="message-time">{{ parseTime(message.sendTime, '{m}-{d} {h}:{i}:{s}') }}</span>
              </div>
              <div class="message-content">{{ message.content }}</div>
            </div>
          </div>
        </div>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="handleReply(currentMessage)" v-if="currentMessage.familyMessages && currentMessage.familyMessages.length > 0">处理对话</el-button>
          <el-button @click="viewDialogVisible = false">关 闭</el-button>
        </div>
      </el-dialog>
  
      <!-- 回复消息对话框 -->
      <el-dialog title="处理对话" :visible.sync="replyDialogVisible" width="600px" append-to-body>
        <div class="reply-context">
          <div class="conversation-info">
            <h4>对话信息</h4>
            <p><strong>家属：</strong>{{ replyContext.familyName }}</p>
            <p><strong>老人：</strong>{{ replyContext.elderlyName }}</p>
            <p><strong>开始时间：</strong>{{ parseTime(replyContext.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</p>
          </div>
          
          <div class="conversation-messages">
            <h4>对话内容</h4>
            <!-- 按时间顺序显示所有消息 -->
            <div v-for="message in replyContext.messages" :key="message.messageId" class="message-item" :class="message.senderType === 'family' ? 'family-message' : 'staff-message'">
              <div class="message-header">
                <el-tag size="mini" :type="message.senderType === 'family' ? 'primary' : 'success'">
                  {{ message.senderType === 'family' ? '家属' : '护理人员' }}
                </el-tag>
                <span class="message-time">{{ parseTime(message.sendTime, '{m}-{d} {h}:{i}') }}</span>
              </div>
              <div class="message-content">{{ message.content }}</div>
            </div>
          </div>
        </div>
        <el-form ref="replyForm" :model="replyForm" :rules="replyRules" label-width="80px">
          <el-form-item label="回复内容" prop="content">
            <el-input 
              v-model="replyForm.content" 
              type="textarea" 
              :rows="4"
              placeholder="请输入回复内容" 
            />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitReply" :loading="replyLoading">发送回复</el-button>
          <el-button @click="replyDialogVisible = false">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { listCommunication, getCommunication, delCommunication, addCommunication, updateCommunication } from "@/api/website/communication";
  
  export default {
    name: "Communication",
    data() {
      return {
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 网站沟通消息表格数据
        communicationList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 100,
          familyName: null,
          elderlyName: null,
          senderType: null,
          isRead: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          familyId: [
            { required: true, message: "家属ID不能为空", trigger: "blur" }
          ],
          elderlyId: [
            { required: true, message: "老人ID不能为空", trigger: "blur" }
          ],
          senderType: [
            { required: true, message: "发送者类型不能为空", trigger: "change" }
          ],
          senderName: [
            { required: true, message: "发送者姓名不能为空", trigger: "blur" }
          ],
          content: [
            { required: true, message: "消息内容不能为空", trigger: "blur" }
          ]
        },
        // 查看对话框显示状态
        viewDialogVisible: false,
        // 当前查看的消息
        currentMessage: {},
        // 回复对话框显示状态
        replyDialogVisible: false,
        // 回复上下文
        replyContext: {},
        // 回复表单
        replyForm: {
          content: ''
        },
        // 回复表单校验
        replyRules: {
          content: [
            { required: true, message: "回复内容不能为空", trigger: "blur" }
          ]
        },
        // 回复加载状态
        replyLoading: false
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询网站沟通消息列表 */
      getList() {
        this.loading = true;
        listCommunication(this.queryParams).then(response => {
          const messages = response.rows || [];
          this.communicationList = this.groupMessagesByConversation(messages);
          this.total = this.communicationList.length;
          this.loading = false;
        });
      },
      // 将消息按对话分组（按家属、老人、日期分组）
      groupMessagesByConversation(messages) {
        if (!messages || messages.length === 0) return [];
        
        // 按时间排序
        const sortedMessages = messages.sort((a, b) => new Date(a.sendTime) - new Date(b.sendTime));
        
        const conversations = [];
        const conversationMap = {};
        
        sortedMessages.forEach(message => {
          // 获取日期（YYYY-MM-DD格式）
          const messageDate = new Date(message.sendTime).toISOString().split('T')[0];
          
          // 生成对话的唯一标识：家属ID_老人ID_日期
          const conversationKey = `${message.familyId}_${message.elderlyId}_${messageDate}`;
          
          if (!conversationMap[conversationKey]) {
            // 创建新的对话
            conversationMap[conversationKey] = {
              conversationId: conversationKey,
              familyId: message.familyId,
              elderlyId: message.elderlyId,
              familyName: message.familyName,
              elderlyName: message.elderlyName,
              conversationDate: messageDate,
              startTime: message.sendTime,
              lastTime: message.sendTime,
              messages: [message],
              familyMessages: message.senderType === 'family' ? [message] : [],
              staffReplies: message.senderType === 'staff' ? [message] : [],
              isRead: message.senderType === 'staff' ? '1' : message.isRead, // 如果是医护人员消息，自动设为已读
              status: message.status
            };
            conversations.push(conversationMap[conversationKey]);
          } else {
            // 添加到现有对话
            const conversation = conversationMap[conversationKey];
            conversation.messages.push(message);
            conversation.lastTime = message.sendTime;
            
            // 根据消息类型分类
            if (message.senderType === 'family') {
              conversation.familyMessages.push(message);
              // 更新已读状态
              if (message.isRead === '1') {
                conversation.isRead = '1';
              }
            } else if (message.senderType === 'staff') {
              conversation.staffReplies.push(message);
              // 如果有医护人员回复，自动设置为已读
              conversation.isRead = '1';
            }
          }
        });
        
        return conversations;
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          messageId: null,
          familyId: null,
          elderlyId: null,
          senderType: null,
          senderName: null,
          content: null,
          sendTime: null,
          isRead: null,
          messageType: null,
          attachmentPath: null,
          status: null
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.messageId)
        this.single = selection.length!==1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加网站沟通消息";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const messageId = row.messageId || this.ids
        getCommunication(messageId).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改网站沟通消息";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.messageId != null) {
              updateCommunication(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addCommunication(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        // 获取对话中所有消息的ID
        const messageIds = row.messages ? row.messages.map(msg => msg.messageId) : [];
        const conversationInfo = `${row.familyName}与${row.elderlyName}在${row.conversationDate}的对话`;
        
        this.$modal.confirm(`是否确认删除"${conversationInfo}"的所有消息？`).then(() => {
          // 批量删除消息
          const deletePromises = messageIds.map(messageId => delCommunication(messageId));
          return Promise.all(deletePromises);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch((error) => {
          console.error('删除失败:', error);
          this.$modal.msgError("删除失败：" + (error.message || '未知错误'));
        });
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('website/communication/export', {
          ...this.queryParams
        }, `communication_${new Date().getTime()}.xlsx`)
      },
      /** 查看消息详情 */
      handleView(row) {
        this.currentMessage = row;
        this.viewDialogVisible = true;
      },
      /** 回复消息 */
      handleReply(row) {
        this.replyContext = row;
        this.replyForm.content = '';
        this.replyDialogVisible = true;
      },
      /** 提交回复 */
      submitReply() {
        this.$refs["replyForm"].validate(valid => {
          if (valid) {
            this.replyLoading = true;
            const replyData = {
              familyId: this.replyContext.familyId,
              elderlyId: this.replyContext.elderlyId,
              senderType: 'staff',
              senderName: this.$store.state.user.name || '护理人员',
              content: this.replyForm.content,
              messageType: 'text',
              status: '0'
            };
            
            addCommunication(replyData).then(response => {
              this.$modal.msgSuccess("回复成功");
              this.replyDialogVisible = false;
              this.getList();
            }).catch(() => {
              this.$modal.msgError("回复失败");
            }).finally(() => {
              this.replyLoading = false;
            });
          }
        });
      }
    }
  };
  </script>
  
  <style scoped>
  .message-detail {
    padding: 20px;
  }
  
  .message-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid #f0f0f0;
  }
  
  .sender-info {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  
  .sender-name {
    font-weight: 500;
    color: #333;
  }
  
  .message-time {
    color: #999;
    font-size: 14px;
  }
  
  .message-content {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 15px;
    line-height: 1.6;
    color: #333;
  }
  
  .message-status {
    text-align: right;
  }
  
  .reply-context {
    margin-bottom: 20px;
  }

  .conversation-info {
    background: #f5f7fa;
    padding: 15px;
    border-radius: 4px;
    margin-bottom: 15px;
  }

  .conversation-info h4 {
    margin: 0 0 10px 0;
    color: #303133;
  }

  .conversation-info p {
    margin: 5px 0;
    color: #606266;
  }

  .conversation-messages {
    background: #fafafa;
    padding: 15px;
    border-radius: 4px;
    max-height: 300px;
    overflow-y: auto;
  }

  .conversation-messages h4 {
    margin: 0 0 15px 0;
    color: #303133;
  }

  .conversation-content {
    max-height: 200px;
    overflow-y: auto;
  }

  .message-item {
    margin-bottom: 10px;
    padding: 8px;
    border-radius: 4px;
  }

  .family-message {
    background: #e3f2fd;
    border-left: 3px solid #2196f3;
  }

  .staff-message {
    background: #e8f5e8;
    border-left: 3px solid #4caf50;
  }

  .message-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px;
  }

  .message-time {
    font-size: 11px;
    color: #999;
  }

  .message-content {
    font-size: 14px;
    line-height: 1.4;
  }
  
  .original-message {
    font-size: 14px;
  }
  
  .message-label {
    font-weight: 500;
    color: #333;
    margin-bottom: 8px;
  }
  
  .message-text {
    color: #666;
    margin-bottom: 8px;
    line-height: 1.5;
  }
  
  .message-sender {
    color: #999;
    font-size: 12px;
  }

  .conversation-detail {
    max-height: 500px;
    overflow-y: auto;
  }

  .conversation-detail .conversation-info {
    background: #f5f7fa;
    padding: 15px;
    border-radius: 4px;
    margin-bottom: 15px;
  }

  .conversation-detail .conversation-info h4 {
    margin: 0 0 10px 0;
    color: #303133;
  }

  .conversation-detail .conversation-info p {
    margin: 5px 0;
    color: #606266;
  }

  .conversation-detail .conversation-messages {
    background: #fafafa;
    padding: 15px;
    border-radius: 4px;
    max-height: 300px;
    overflow-y: auto;
  }

  .conversation-detail .conversation-messages h4 {
    margin: 0 0 15px 0;
    color: #303133;
  }

  .conversation-detail .message-item {
    margin-bottom: 10px;
    padding: 8px;
    border-radius: 4px;
  }

  .conversation-detail .family-message {
    background: #e3f2fd;
    border-left: 3px solid #2196f3;
  }

  .conversation-detail .staff-message {
    background: #e8f5e8;
    border-left: 3px solid #4caf50;
  }

  .conversation-detail .message-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 5px;
  }

  .conversation-detail .sender-name {
    margin-left: 8px;
    font-weight: bold;
  }

  .conversation-detail .message-time {
    font-size: 11px;
    color: #999;
  }

  .conversation-detail .message-content {
    font-size: 14px;
    line-height: 1.4;
  }
  </style>
  