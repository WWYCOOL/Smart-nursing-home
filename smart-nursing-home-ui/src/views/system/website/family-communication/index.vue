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

    <!-- 沟通记录列表 -->
    <el-table v-loading="loading" :data="communicationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="消息ID" align="center" prop="messageId" width="80" />
      <el-table-column label="家属姓名" align="center" prop="familyName" width="100" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" width="100" />
      <el-table-column label="发送者" align="center" prop="senderName" width="100" />
      <el-table-column label="发送者类型" align="center" prop="senderType" width="100">
        <template slot-scope="scope">
          <el-tag :type="scope.row.senderType === 'family' ? 'primary' : 'success'">
            {{ scope.row.senderType === 'family' ? '家属' : '护理人员' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="消息内容" align="center" prop="content" :show-overflow-tooltip="true" min-width="200" />
      <el-table-column label="发送时间" align="center" prop="sendTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.sendTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
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
            v-if="scope.row.senderType === 'family'"
          >回复</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:communication:edit']"
          >修改</el-button>
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

    <!-- 查看消息详情对话框 -->
    <el-dialog title="消息详情" :visible.sync="viewDialogVisible" width="600px" append-to-body>
      <div class="message-detail">
        <div class="message-header">
          <div class="sender-info">
            <el-tag :type="currentMessage.senderType === 'family' ? 'primary' : 'success'">
              {{ currentMessage.senderType === 'family' ? '家属' : '护理人员' }}
            </el-tag>
            <span class="sender-name">{{ currentMessage.senderName }}</span>
          </div>
          <div class="message-time">
            {{ parseTime(currentMessage.sendTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </div>
        </div>
        <div class="message-content">
          {{ currentMessage.content }}
        </div>
        <div class="message-status">
          <el-tag :type="currentMessage.isRead === '1' ? 'success' : 'warning'">
            {{ currentMessage.isRead === '1' ? '已读' : '未读' }}
          </el-tag>
        </div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleReply(currentMessage)" v-if="currentMessage.senderType === 'family'">回复消息</el-button>
        <el-button @click="viewDialogVisible = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 回复消息对话框 -->
    <el-dialog title="回复消息" :visible.sync="replyDialogVisible" width="500px" append-to-body>
      <div class="reply-context">
        <div class="original-message">
          <div class="message-label">原消息：</div>
          <div class="message-text">{{ replyContext.content }}</div>
          <div class="message-sender">发送者：{{ replyContext.senderName }}</div>
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
        pageSize: 10,
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
        this.communicationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
      const messageIds = row.messageId || this.ids;
      this.$modal.confirm('是否确认删除网站沟通消息编号为"' + messageIds + '"的数据项？').then(function() {
        return delCommunication(messageIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
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
  padding: 15px;
  background: #f8f9fa;
  border-radius: 8px;
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
</style>
