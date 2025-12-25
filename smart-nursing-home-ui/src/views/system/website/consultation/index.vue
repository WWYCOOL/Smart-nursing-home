<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关系" prop="relationship">
        <el-select v-model="queryParams.relationship" placeholder="请选择关系" clearable>
          <el-option label="本人" value="本人"></el-option>
          <el-option label="子女" value="子女"></el-option>
          <el-option label="配偶" value="配偶"></el-option>
          <el-option label="其他亲属" value="其他亲属"></el-option>
          <el-option label="朋友" value="朋友"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="咨询类型" prop="consultationType">
        <el-select v-model="queryParams.consultationType" placeholder="请选择咨询类型" clearable>
          <el-option label="入住咨询" value="入住咨询"></el-option>
          <el-option label="服务咨询" value="服务咨询"></el-option>
          <el-option label="费用咨询" value="费用咨询"></el-option>
          <el-option label="参观预约" value="参观预约"></el-option>
          <el-option label="其他" value="其他"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="处理状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择处理状态" clearable>
          <el-option label="待处理" value="0"></el-option>
          <el-option label="已处理" value="1"></el-option>
          <el-option label="已回复" value="2"></el-option>
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
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['website:consultation:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:consultation:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="consultationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="咨询ID" align="center" prop="consultationId" width="80" />
      <el-table-column label="姓名" align="center" prop="name" width="100" />
      <el-table-column label="联系电话" align="center" prop="phone" width="120" />
      <el-table-column label="关系" align="center" prop="relationship" width="80" />
      <el-table-column label="咨询类型" align="center" prop="consultationType" width="100" />
      <el-table-column label="咨询内容" align="center" prop="message" show-overflow-tooltip />
      <el-table-column label="处理状态" align="center" prop="status" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == '0'" type="warning">待处理</el-tag>
          <el-tag v-else-if="scope.row.status == '1'" type="info">已处理</el-tag>
          <el-tag v-else-if="scope.row.status == '2'" type="success">已回复</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="回复内容" align="center" prop="replyContent" show-overflow-tooltip />
      <el-table-column label="回复人" align="center" prop="replyUser" width="100" />
      <el-table-column label="回复时间" align="center" prop="replyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.replyTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['website:consultation:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleReply(scope.row)"
            v-hasPermi="['website:consultation:reply']"
            v-if="scope.row.status != '2'"
          >回复</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:consultation:remove']"
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

    <!-- 查看咨询详情对话框 -->
    <el-dialog title="咨询详情" :visible.sync="viewOpen" width="600px" append-to-body>
      <el-form ref="form" :model="form" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名:">
              <span>{{ form.name }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话:">
              <span>{{ form.phone }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="关系:">
              <span>{{ form.relationship }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="咨询类型:">
              <span>{{ form.consultationType }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="咨询内容:">
          <div style="background: #f5f5f5; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ form.message }}
          </div>
        </el-form-item>
        <el-form-item label="处理状态:">
          <el-tag v-if="form.status == '0'" type="warning">待处理</el-tag>
          <el-tag v-else-if="form.status == '1'" type="info">已处理</el-tag>
          <el-tag v-else-if="form.status == '2'" type="success">已回复</el-tag>
        </el-form-item>
        <el-form-item label="回复内容:" v-if="form.replyContent">
          <div style="background: #f0f9ff; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ form.replyContent }}
          </div>
        </el-form-item>
        <el-row v-if="form.replyUser">
          <el-col :span="12">
            <el-form-item label="回复人:">
              <span>{{ form.replyUser }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="回复时间:">
              <span>{{ parseTime(form.replyTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="创建时间:">
          <span>{{ parseTime(form.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewOpen = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 回复咨询对话框 -->
    <el-dialog title="回复咨询" :visible.sync="replyOpen" width="600px" append-to-body>
      <el-form ref="replyForm" :model="replyForm" :rules="replyRules" label-width="100px">
        <el-form-item label="咨询内容:">
          <div style="background: #f5f5f5; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ replyForm.message }}
          </div>
        </el-form-item>
        <el-form-item label="回复内容:" prop="replyContent">
          <el-input
            v-model="replyForm.replyContent"
            type="textarea"
            :rows="6"
            placeholder="请输入回复内容"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="replyOpen = false">取 消</el-button>
        <el-button type="primary" @click="submitReply">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listConsultation, getConsultation, delConsultation, replyConsultation } from "@/api/website/consultation";

export default {
  name: "Consultation",
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
      // 咨询信息表格数据
      consultationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      viewOpen: false,
      replyOpen: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        phone: null,
        relationship: null,
        consultationType: null,
        status: null
      },
      // 表单参数
      form: {},
      // 回复表单参数
      replyForm: {},
      // 回复表单校验
      replyRules: {
        replyContent: [
          { required: true, message: "回复内容不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询咨询信息列表 */
    getList() {
      this.loading = true;
      listConsultation(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.consultationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.viewOpen = false;
      this.replyOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        consultationId: null,
        name: null,
        phone: null,
        relationship: null,
        consultationType: null,
        message: null,
        status: null,
        replyContent: null,
        replyTime: null,
        replyUser: null,
        createTime: null,
        updateTime: null,
        remark: null
      };
      this.replyForm = {
        consultationId: null,
        message: null,
        replyContent: null
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.consultationId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.reset();
      const consultationId = row.consultationId || this.ids
      getConsultation(consultationId).then(response => {
        this.form = response.data;
        this.viewOpen = true;
      });
    },
    /** 回复按钮操作 */
    handleReply(row) {
      this.reset();
      this.replyForm = {
        consultationId: row.consultationId,
        message: row.message,
        replyContent: null
      };
      this.replyOpen = true;
    },
    /** 提交回复 */
    submitReply() {
      this.$refs["replyForm"].validate(valid => {
        if (valid) {
          replyConsultation(this.replyForm).then(response => {
            this.$modal.msgSuccess("回复成功");
            this.replyOpen = false;
            this.getList();
          });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const consultationIds = row.consultationId || this.ids;
      this.$modal.confirm('是否确认删除咨询信息编号为"' + consultationIds + '"的数据项？').then(function() {
        return delConsultation(consultationIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/consultation/export', {
        ...this.queryParams
      }, `咨询信息_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>



