<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="反馈类型" prop="feedbackType">
        <el-select v-model="queryParams.feedbackType" placeholder="请选择反馈类型" clearable>
          <el-option
            v-for="dict in dict.type.feedback_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="反馈标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入反馈标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系人" prop="contactName">
        <el-input
          v-model="queryParams.contactName"
          placeholder="请输入联系人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系邮箱" prop="contactEmail">
        <el-input
          v-model="queryParams.contactEmail"
          placeholder="请输入联系邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="处理状态" prop="feedbackStatus">
        <el-select v-model="queryParams.feedbackStatus" placeholder="请选择处理状态" clearable>
          <el-option
            v-for="dict in dict.type.feedback_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
          v-hasPermi="['website:feedback:add']"
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
          v-hasPermi="['website:feedback:edit']"
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
          v-hasPermi="['website:feedback:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:feedback:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="feedbackList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="反馈ID" align="center" prop="feedbackId" width="80" />
      <el-table-column label="反馈类型" align="center" prop="feedbackType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.feedback_type" :value="scope.row.feedbackType"/>
        </template>
      </el-table-column>
      <el-table-column label="反馈标题" align="center" prop="title" min-width="150" show-overflow-tooltip />
      <el-table-column label="联系人" align="center" prop="contactName" width="100" />
      <el-table-column label="联系电话" align="center" prop="contactPhone" width="120" />
      <el-table-column label="联系邮箱" align="center" prop="contactEmail" width="150" show-overflow-tooltip>
        <template slot-scope="scope">
          <span v-if="scope.row.contactEmail">{{ scope.row.contactEmail }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="关联老人" align="center" prop="elderlyName" width="100">
        <template slot-scope="scope">
          <span v-if="scope.row.elderlyName">{{ scope.row.elderlyName }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="优先级" align="center" prop="priority" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.feedback_priority" :value="scope.row.priority"/>
        </template>
      </el-table-column>
      <el-table-column label="处理状态" align="center" prop="feedbackStatus" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.feedback_status" :value="scope.row.feedbackStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="250">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['website:feedback:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:feedback:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-chat-line-round"
            @click="handleReply(scope.row)"
            v-hasPermi="['website:feedback:reply']"
            v-if="scope.row.feedbackStatus != '2'"
          >处理</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:feedback:remove']"
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

    <!-- 添加或修改意见反馈对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="60%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="反馈类型" prop="feedbackType">
              <el-select v-model="form.feedbackType" placeholder="请选择反馈类型">
                <el-option
                  v-for="dict in dict.type.feedback_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="优先级" prop="priority">
              <el-select v-model="form.priority" placeholder="请选择优先级">
                <el-option
                  v-for="dict in dict.type.feedback_priority"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="反馈标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入反馈标题" />
        </el-form-item>
        <el-form-item label="反馈内容" prop="content">
          <el-input v-model="form.content" type="textarea" :rows="4" placeholder="请输入反馈内容" />
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="联系人" prop="contactName">
              <el-input v-model="form.contactName" placeholder="请输入联系人姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系电话" prop="contactPhone">
              <el-input v-model="form.contactPhone" placeholder="请输入联系电话" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="联系邮箱" prop="contactEmail">
              <el-input v-model="form.contactEmail" placeholder="请输入联系邮箱（可选）" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="关联老人" prop="elderlyId">
              <el-select
                v-model="form.elderlyId"
                placeholder="请选择关联老人（可选）"
                filterable
                remote
                :remote-method="searchElderly"
                :loading="elderlyLoading"
                @change="handleElderlyChange"
                @focus="loadElderlyList"
                clearable
                style="width: 100%"
              >
                <el-option
                  v-for="item in elderlyOptions"
                  :key="item.elderlyId"
                  :label="`${item.elderlyName} (${item.roomNumber}-${item.bedNumber}) - ${item.idCard}`"
                  :value="item.elderlyId"
                >
                  <div style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                      <div style="font-weight: bold;">{{ item.elderlyName }}</div>
                      <div style="color: #8492a6; font-size: 12px;">{{ item.roomNumber }}-{{ item.bedNumber }}</div>
                    </div>
                    <div style="color: #999; font-size: 11px; text-align: right;">
                      {{ item.idCard }}
                    </div>
                  </div>
                </el-option>
                <div v-if="elderlyOptions.length === 0 && !elderlyLoading" style="text-align: center; color: #999; padding: 10px;">
                  暂无老人数据，请先添加老人信息
                </div>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="处理状态" prop="feedbackStatus">
              <el-select v-model="form.feedbackStatus" placeholder="请选择处理状态">
                <el-option
                  v-for="dict in dict.type.feedback_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 意见反馈查看对话框 -->
    <el-dialog title="意见反馈详情" :visible.sync="detailOpen" width="60%" append-to-body>
      <div style="margin-bottom: 20px;">
        <el-row :gutter="20">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">反馈类型：</span>
              <span class="value">
                <dict-tag :options="dict.type.feedback_type" :value="form.feedbackType"/>
              </span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">优先级：</span>
              <span class="value">
                <dict-tag :options="dict.type.feedback_priority" :value="form.priority"/>
              </span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="24">
            <div class="detail-item">
              <span class="label">反馈标题：</span>
              <span class="value">{{ form.title || '-' }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="24">
            <div class="detail-item">
              <span class="label">反馈内容：</span>
              <span class="value">{{ form.content || '-' }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="8">
            <div class="detail-item">
              <span class="label">联系人：</span>
              <span class="value">{{ form.contactName || '-' }}</span>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="detail-item">
              <span class="label">联系电话：</span>
              <span class="value">{{ form.contactPhone || '-' }}</span>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="detail-item">
              <span class="label">联系邮箱：</span>
              <span class="value">{{ form.contactEmail || '-' }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">关联老人：</span>
              <span class="value">{{ form.elderlyName || '-' }}</span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">处理状态：</span>
              <span class="value">
                <dict-tag :options="dict.type.feedback_status" :value="form.feedbackStatus"/>
              </span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.replyContent">
          <el-col :span="24">
            <div class="detail-item">
              <span class="label">回复内容：</span>
              <span class="value">{{ form.replyContent }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.replyBy">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">回复人：</span>
              <span class="value">{{ form.replyBy }}</span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">回复时间：</span>
              <span class="value">{{ parseTime(form.replyTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.processBy">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">处理人：</span>
              <span class="value">{{ form.processBy }}</span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">处理时间：</span>
              <span class="value">{{ parseTime(form.processTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.remark">
          <el-col :span="24">
            <div class="detail-item">
              <span class="label">备注：</span>
              <span class="value">{{ form.remark }}</span>
            </div>
          </el-col>
        </el-row>
      </div>
      
      <div slot="footer" class="dialog-footer">
        <el-button @click="detailOpen = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 回复意见反馈对话框 -->
    <el-dialog title="处理结果" :visible.sync="replyOpen" width="50%" append-to-body>
      <el-form ref="replyForm" :model="replyForm" :rules="replyRules" label-width="80px">
        <el-form-item label="反馈标题">
          <el-input v-model="replyForm.title" disabled />
        </el-form-item>
        <el-form-item label="处理结果" prop="replyContent">
          <el-input v-model="replyForm.replyContent" type="textarea" :rows="6" placeholder="请输入回复内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitReply">确 定</el-button>
        <el-button @click="cancelReply">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFeedback, getFeedback, delFeedback, addFeedback, updateFeedback, replyFeedback, processFeedback } from "@/api/website/feedback";
import { listElderlyInfo } from "@/api/website/elderly-info";

export default {
  name: "Feedback",
  dicts: ['feedback_type', 'feedback_status', 'feedback_priority'],
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
      // 意见反馈表格数据
      feedbackList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示详情弹出层
      detailOpen: false,
      // 是否显示回复弹出层
      replyOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        feedbackType: null,
        title: null,
        contactName: null,
        contactEmail: null,
        feedbackStatus: null,
        priority: null,
      },
      // 表单参数
      form: {},
      // 回复表单参数
      replyForm: {},
      // 表单校验
      rules: {
        feedbackType: [
          { required: true, message: "反馈类型不能为空", trigger: "change" }
        ],
        title: [
          { required: true, message: "反馈标题不能为空", trigger: "blur" }
        ],
        content: [
          { required: true, message: "反馈内容不能为空", trigger: "blur" }
        ],
        contactName: [
          { required: true, message: "联系人姓名不能为空", trigger: "blur" }
        ],
        contactPhone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" }
        ],
        contactEmail: [
          { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
        ]
      },
      // 回复表单校验
      replyRules: {
        replyContent: [
          { required: true, message: "回复内容不能为空", trigger: "blur" }
        ]
      },
      // 日期范围
      dateRange: [],
      // 老人选项
      elderlyOptions: [],
      elderlyLoading: false
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询意见反馈列表 */
    getList() {
      this.loading = true;
      listFeedback(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.feedbackList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 取消回复
    cancelReply() {
      this.replyOpen = false;
      this.resetReply();
    },
    // 表单重置
    reset() {
      this.form = {
        feedbackId: null,
        feedbackType: null,
        title: null,
        content: null,
        contactName: null,
        contactPhone: null,
        contactEmail: null,
        elderlyId: null,
        elderlyName: null,
        feedbackStatus: '0',
        priority: '2',
        replyContent: null,
        replyBy: null,
        replyTime: null,
        processBy: null,
        processTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 回复表单重置
    resetReply() {
      this.replyForm = {
        feedbackId: null,
        title: null,
        replyContent: null
      };
      this.resetForm("replyForm");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.feedbackId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.loadElderlyList();
      this.open = true;
      this.title = "添加意见反馈";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const feedbackId = row.feedbackId || this.ids
      getFeedback(feedbackId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改意见反馈";
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.form = { ...row };
      this.detailOpen = true;
    },
    /** 回复按钮操作 */
    handleReply(row) {
      this.resetReply();
      this.replyForm = {
        feedbackId: row.feedbackId,
        title: row.title,
        replyContent: row.replyContent || ''
      };
      this.replyOpen = true;
    },
    /** 处理按钮操作 */
    handleProcess(row) {
      this.$modal.confirm('是否确认处理该意见反馈？').then(() => {
        const processData = {
          feedbackId: row.feedbackId,
          feedbackStatus: '1'
        };
        processFeedback(processData).then(() => {
          this.getList();
          this.$modal.msgSuccess("处理成功");
        });
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.feedbackId != null) {
            updateFeedback(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFeedback(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 提交回复 */
    submitReply() {
      this.$refs["replyForm"].validate(valid => {
        if (valid) {
          const replyData = {
            feedbackId: this.replyForm.feedbackId,
            replyContent: this.replyForm.replyContent,
            feedbackStatus: '2'
          };
          replyFeedback(replyData).then(() => {
            this.$modal.msgSuccess("回复成功");
            this.replyOpen = false;
            this.getList();
          });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const feedbackIds = row.feedbackId || this.ids;
      this.$modal.confirm('是否确认删除意见反馈编号为"' + feedbackIds + '"的数据项？').then(function() {
        return delFeedback(feedbackIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/feedback/export', {
        ...this.queryParams
      }, `feedback_${new Date().getTime()}.xlsx`)
    },
    /** 搜索老人 */
    searchElderly(query) {
      this.elderlyLoading = true;
      const params = {
        status: '0',
        pageNum: 1,
        pageSize: 20
      };
      
      if (query && query.trim() !== '') {
        if (/^\d{17}[\dXx]$/.test(query.trim())) {
          params.idCard = query.trim();
        } else {
          params.elderlyName = query.trim();
        }
      }
      
      listElderlyInfo(params).then(response => {
        this.elderlyOptions = response.rows || [];
        this.elderlyLoading = false;
      }).catch(() => {
        this.elderlyLoading = false;
      });
    },
    /** 选择老人 */
    handleElderlyChange(elderlyId) {
      const selectedElderly = this.elderlyOptions.find(item => item.elderlyId === elderlyId);
      if (selectedElderly) {
        this.form.elderlyName = selectedElderly.elderlyName;
      } else {
        this.form.elderlyName = null;
      }
    },
    /** 加载老人列表 */
    loadElderlyList() {
      if (this.elderlyOptions.length === 0) {
        this.searchElderly('');
      }
    }
  }
};
</script>

<style scoped>
.detail-item {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.detail-item .label {
  font-weight: 600;
  color: #606266;
  min-width: 80px;
  margin-right: 10px;
}

.detail-item .value {
  color: #303133;
  flex: 1;
}
</style>
