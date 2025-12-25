<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="服务标题" prop="serviceTitle">
        <el-input
          v-model="queryParams.serviceTitle"
          placeholder="请输入服务标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_normal_disable"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
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
          v-hasPermi="['system:medical-services:add']"
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
          v-hasPermi="['system:medical-services:edit']"
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
          v-hasPermi="['system:medical-services:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicalServicesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="服务ID" align="center" prop="serviceId" />
      <el-table-column label="服务标题" align="center" prop="serviceTitle" />
      <el-table-column label="服务图标" align="center" prop="serviceIcon" width="80">
        <template slot-scope="scope">
          <i :class="scope.row.serviceIcon || 'el-icon-first-aid-kit'" style="font-size: 24px; color: #409EFF;"></i>
        </template>
      </el-table-column>
      <el-table-column label="服务描述" align="center" prop="serviceDescription" show-overflow-tooltip />
      <el-table-column label="服务时间" align="center" prop="serviceTime" />
      <el-table-column label="服务人员" align="center" prop="serviceStaff" />
      <el-table-column label="排序" align="center" prop="sortOrder" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:medical-services:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:medical-services:remove']"
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

    <!-- 添加或修改医疗护理服务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="服务标题" prop="serviceTitle">
          <el-input v-model="form.serviceTitle" placeholder="请输入服务标题" />
        </el-form-item>
        <el-form-item label="服务图标" prop="serviceIcon">
          <el-row :gutter="10">
            <el-col :span="12">
              <el-input v-model="form.serviceIcon" placeholder="请输入图标类名" />
            </el-col>
            <el-col :span="12">
              <div class="icon-preview">
                <span>预览：</span>
                <i :class="form.serviceIcon || 'el-icon-first-aid-kit'" style="font-size: 20px; color: #409EFF;"></i>
              </div>
            </el-col>
          </el-row>
          <div class="icon-suggestions">
            <p>医疗相关图标：</p>
            <div class="icon-list">
              <span v-for="icon in iconSuggestions" :key="icon" @click="form.serviceIcon = icon" class="icon-item">
                <i :class="icon"></i>
              </span>
            </div>
          </div>
        </el-form-item>
        <el-form-item label="服务描述" prop="serviceDescription">
          <el-input v-model="form.serviceDescription" type="textarea" :rows="3" placeholder="请输入服务描述" />
        </el-form-item>
        <el-form-item label="服务时间" prop="serviceTime">
          <el-input v-model="form.serviceTime" placeholder="请输入服务时间" />
        </el-form-item>
        <el-form-item label="服务人员" prop="serviceStaff">
          <el-input v-model="form.serviceStaff" placeholder="请输入服务人员" />
        </el-form-item>
        <el-form-item label="排序" prop="sortOrder">
          <el-input-number v-model="form.sortOrder" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
  </div>
</template>

<script>
import { listMedicalServices, getMedicalServices, delMedicalServices, addMedicalServices, updateMedicalServices } from "@/api/website/medical-services";

export default {
  name: "MedicalServices",
  dicts: ['sys_normal_disable'],
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
      // 医疗护理服务表格数据
      medicalServicesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        serviceTitle: null,
        status: null
      },
      // 表单参数
      form: {},
      // 图标建议
      iconSuggestions: [
        'el-icon-medicine-box', 'el-icon-pill', 'el-icon-refresh',
        'el-icon-warning', 'el-icon-first-aid-kit', 'el-icon-user-solid',
        'el-icon-star-on', 'el-icon-location', 'el-icon-headset'
      ],
      // 表单校验
      rules: {
        serviceTitle: [
          { required: true, message: "服务标题不能为空", trigger: "blur" }
        ],
        serviceIcon: [
          { required: true, message: "服务图标不能为空", trigger: "blur" }
        ],
        serviceDescription: [
          { required: true, message: "服务描述不能为空", trigger: "blur" }
        ],
        serviceTime: [
          { required: true, message: "服务时间不能为空", trigger: "blur" }
        ],
        serviceStaff: [
          { required: true, message: "服务人员不能为空", trigger: "blur" }
        ],
        sortOrder: [
          { required: true, message: "排序不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询医疗护理服务列表 */
    getList() {
      this.loading = true;
      listMedicalServices(this.queryParams).then(response => {
        this.medicalServicesList = response.rows;
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
        serviceId: null,
        serviceTitle: null,
        serviceIcon: 'el-icon-first-aid-kit',
        serviceDescription: null,
        serviceTime: null,
        serviceStaff: null,
        sortOrder: 0,
        status: "0",
        remark: null
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
      this.ids = selection.map(item => item.serviceId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加医疗护理服务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const serviceId = row.serviceId || this.ids
      getMedicalServices(serviceId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改医疗护理服务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.serviceId != null) {
            updateMedicalServices(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMedicalServices(this.form).then(response => {
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
      const serviceIds = row.serviceId || this.ids;
      this.$modal.confirm('是否确认删除医疗护理服务编号为"' + serviceIds + '"的数据项？').then(function() {
        return delMedicalServices(serviceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
<style scoped>
.icon-preview {
  display: flex;
  align-items: center;
  margin-top: 5px;
  color: #606266;
}
.icon-preview span {
  margin-right: 10px;
}
.icon-suggestions {
  margin-top: 15px;
  border-top: 1px solid #eee;
  padding-top: 10px;
}
.icon-suggestions p {
  margin-bottom: 10px;
  font-size: 14px;
  color: #909399;
}
.icon-list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
.icon-item {
  font-size: 20px;
  cursor: pointer;
  padding: 5px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  transition: all 0.2s;
  color: #606266;
}
.icon-item:hover {
  border-color: #409EFF;
  color: #409EFF;
  box-shadow: 0 0 5px rgba(64, 158, 255, 0.2);
}
</style>








