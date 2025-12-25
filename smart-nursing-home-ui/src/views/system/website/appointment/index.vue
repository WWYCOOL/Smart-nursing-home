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
      <el-form-item label="性别" prop="gender">
        <el-select v-model="queryParams.gender" placeholder="请选择性别" clearable>
          <el-option label="男" value="男"></el-option>
          <el-option label="女" value="女"></el-option>
        </el-select>
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
      <el-form-item label="预约状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择预约状态" clearable>
          <el-option label="待确认" value="0"></el-option>
          <el-option label="已确认" value="1"></el-option>
          <el-option label="已取消" value="2"></el-option>
          <el-option label="已完成" value="3"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="预约时间">
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
          v-hasPermi="['website:appointment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:appointment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="appointmentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="姓名" align="center" prop="name" width="100" />
      <el-table-column label="性别" align="center" prop="gender" width="60" />
      <el-table-column label="联系电话" align="center" prop="phone" width="120" />
      <el-table-column label="年龄" align="center" prop="age" width="60" />
      <el-table-column label="预约时间" align="center" prop="appointmentTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.appointmentTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="参观人数" align="center" prop="visitorCount" width="80" />
      <el-table-column label="关系" align="center" prop="relationship" width="80" />
      <el-table-column label="健康状况" align="center" prop="healthStatus" width="100" />
      <el-table-column label="预约状态" align="center" prop="status" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == '0'" type="warning">待确认</el-tag>
          <el-tag v-else-if="scope.row.status == '1'" type="success">已确认</el-tag>
          <el-tag v-else-if="scope.row.status == '2'" type="danger">已取消</el-tag>
          <el-tag v-else-if="scope.row.status == '3'" type="info">已完成</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="确认人" align="center" prop="confirmUser" width="100" />
      <el-table-column label="确认时间" align="center" prop="confirmTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.confirmTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
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
            v-hasPermi="['website:appointment:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleConfirm(scope.row)"
            v-hasPermi="['website:appointment:confirm']"
            v-if="scope.row.status == '0'"
          >确认</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-close"
            @click="handleCancel(scope.row)"
            v-hasPermi="['website:appointment:cancel']"
            v-if="scope.row.status != '2' && scope.row.status != '3'"
          >取消</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:appointment:remove']"
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

    <!-- 查看预约详情对话框 -->
    <el-dialog title="预约详情" :visible.sync="viewOpen" width="800px" append-to-body>
      <el-form ref="form" :model="form" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="姓名:">
              <span>{{ form.name }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性别:">
              <span>{{ form.gender }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="联系电话:">
              <span>{{ form.phone }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="年龄:">
              <span>{{ form.age }}岁</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="预约时间:">
              <span>{{ parseTime(form.appointmentTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="参观人数:">
              <span>{{ form.visitorCount }}人</span>
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
            <el-form-item label="健康状况:">
              <span>{{ form.healthStatus }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="特殊需求:">
          <div style="background: #f5f5f5; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ form.specialNeeds || '无' }}
          </div>
        </el-form-item>
        <el-form-item label="备注:">
          <div style="background: #f5f5f5; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ form.remark || '无' }}
          </div>
        </el-form-item>
        <el-form-item label="预约状态:">
          <el-tag v-if="form.status == '0'" type="warning">待确认</el-tag>
          <el-tag v-else-if="form.status == '1'" type="success">已确认</el-tag>
          <el-tag v-else-if="form.status == '2'" type="danger">已取消</el-tag>
          <el-tag v-else-if="form.status == '3'" type="info">已完成</el-tag>
        </el-form-item>
        <el-row v-if="form.confirmUser">
          <el-col :span="12">
            <el-form-item label="确认人:">
              <span>{{ form.confirmUser }}</span>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="确认时间:">
              <span>{{ parseTime(form.confirmTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="取消原因:" v-if="form.cancelReason">
          <div style="background: #fef0f0; padding: 10px; border-radius: 4px; min-height: 60px;">
            {{ form.cancelReason }}
          </div>
        </el-form-item>
        <el-form-item label="创建时间:">
          <span>{{ parseTime(form.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewOpen = false">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 取消预约对话框 -->
    <el-dialog title="取消预约" :visible.sync="cancelOpen" width="500px" append-to-body>
      <el-form ref="cancelForm" :model="cancelForm" :rules="cancelRules" label-width="100px">
        <el-form-item label="预约人:">
          <span>{{ cancelForm.name }}</span>
        </el-form-item>
        <el-form-item label="预约时间:">
          <span>{{ parseTime(cancelForm.appointmentTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </el-form-item>
        <el-form-item label="取消原因:" prop="cancelReason">
          <el-input
            v-model="cancelForm.cancelReason"
            type="textarea"
            :rows="4"
            placeholder="请输入取消原因"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelOpen = false">取 消</el-button>
        <el-button type="primary" @click="submitCancel">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAppointment, getAppointment, delAppointment, confirmAppointment, cancelAppointment } from "@/api/website/appointment";

export default {
  name: "Appointment",
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
      // 预约信息表格数据
      appointmentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      viewOpen: false,
      cancelOpen: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        phone: null,
        gender: null,
        relationship: null,
        status: null
      },
      // 表单参数
      form: {},
      // 取消表单参数
      cancelForm: {},
      // 取消表单校验
      cancelRules: {
        cancelReason: [
          { required: true, message: "取消原因不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询预约信息列表 */
    getList() {
      this.loading = true;
      listAppointment(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.appointmentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.viewOpen = false;
      this.cancelOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        appointmentId: null,
        name: null,
        gender: null,
        phone: null,
        age: null,
        appointmentTime: null,
        visitorCount: null,
        relationship: null,
        healthStatus: null,
        specialNeeds: null,
        remark: null,
        status: null,
        confirmTime: null,
        confirmUser: null,
        cancelReason: null,
        createTime: null,
        updateTime: null
      };
      this.cancelForm = {
        appointmentId: null,
        name: null,
        appointmentTime: null,
        cancelReason: null
      };
      this.resetForm("form");
      this.resetForm("cancelForm");
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
      this.ids = selection.map(item => item.appointmentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.reset();
      const appointmentId = row.appointmentId || this.ids
      getAppointment(appointmentId).then(response => {
        this.form = response.data;
        this.viewOpen = true;
      });
    },
    /** 确认按钮操作 */
    handleConfirm(row) {
      this.$modal.confirm('是否确认该预约？').then(function() {
        return confirmAppointment({ appointmentId: row.appointmentId });
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("确认成功");
      }).catch(() => {});
    },
    /** 取消按钮操作 */
    handleCancel(row) {
      this.reset();
      this.cancelForm = {
        appointmentId: row.appointmentId,
        name: row.name,
        appointmentTime: row.appointmentTime,
        cancelReason: null
      };
      this.cancelOpen = true;
    },
    /** 提交取消 */
    submitCancel() {
      this.$refs["cancelForm"].validate(valid => {
        if (valid) {
          cancelAppointment(this.cancelForm).then(response => {
            this.$modal.msgSuccess("取消成功");
            this.cancelOpen = false;
            this.getList();
          });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const appointmentIds = row.appointmentId || this.ids;
      this.$modal.confirm('是否确认删除预约信息编号为"' + appointmentIds + '"的数据项？').then(function() {
        return delAppointment(appointmentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/appointment/export', {
        ...this.queryParams
      }, `预约信息_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>



