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
          v-hasPermi="['system:care-services:add']"
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
          v-hasPermi="['system:care-services:edit']"
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
          v-hasPermi="['system:care-services:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="careServicesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="服务ID" align="center" prop="serviceId" />
      <el-table-column label="服务标题" align="center" prop="serviceTitle" />
      <el-table-column label="服务时间" align="center" prop="serviceTime" />
      <el-table-column label="服务描述" align="center" prop="serviceDescription" show-overflow-tooltip />
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
            v-hasPermi="['system:care-services:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:care-services:remove']"
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

    <!-- 添加或修改生活照料服务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="服务标题" prop="serviceTitle">
          <el-input v-model="form.serviceTitle" placeholder="请输入服务标题" />
        </el-form-item>
        <el-form-item label="服务时间" prop="serviceTime">
          <el-input v-model="form.serviceTime" placeholder="请输入服务时间，如：06:00-08:00" />
        </el-form-item>
        <el-form-item label="服务描述" prop="serviceDescription">
          <el-input v-model="form.serviceDescription" type="textarea" :rows="3" placeholder="请输入服务描述" />
        </el-form-item>
        <el-form-item label="服务特色" prop="serviceFeatures">
          <el-input v-model="form.serviceFeatures" type="textarea" :rows="4" placeholder="请输入服务特色，每行一个特色" />
          <div class="form-tip">每行输入一个服务特色，系统会自动转换为JSON格式</div>
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
import { listCareServices, getCareServices, delCareServices, addCareServices, updateCareServices } from "@/api/website/care-services";

export default {
  name: "CareServices",
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
      // 生活照料服务表格数据
      careServicesList: [],
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
      // 表单校验
      rules: {
        serviceTitle: [
          { required: true, message: "服务标题不能为空", trigger: "blur" }
        ],
        serviceTime: [
          { required: true, message: "服务时间不能为空", trigger: "blur" }
        ],
        serviceDescription: [
          { required: true, message: "服务描述不能为空", trigger: "blur" }
        ],
        serviceFeatures: [
          { required: true, message: "服务特色不能为空", trigger: "blur" }
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
    /** 查询生活照料服务列表 */
    getList() {
      this.loading = true;
      listCareServices(this.queryParams).then(response => {
        this.careServicesList = response.rows;
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
        serviceTime: null,
        serviceDescription: null,
        serviceFeatures: null,
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
      this.title = "添加生活照料服务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const serviceId = row.serviceId || this.ids
      getCareServices(serviceId).then(response => {
        this.form = response.data;
        // 将JSON格式的服务特色转换为文本格式
        if (this.form.serviceFeatures) {
          try {
            const features = JSON.parse(this.form.serviceFeatures);
            if (Array.isArray(features)) {
              this.form.serviceFeatures = features.join('\n');
            }
          } catch (e) {
            // 如果解析失败，保持原样
          }
        }
        this.open = true;
        this.title = "修改生活照料服务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 将文本格式的服务特色转换为JSON格式
          if (this.form.serviceFeatures) {
            const features = this.form.serviceFeatures.split('\n').filter(item => item.trim());
            this.form.serviceFeatures = JSON.stringify(features);
          }
          
          if (this.form.serviceId != null) {
            updateCareServices(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCareServices(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除生活照料服务编号为"' + serviceIds + '"的数据项？').then(function() {
        return delCareServices(serviceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
<style scoped>
.form-tip {
  font-size: 12px;
  color: #909399;
  margin-top: 5px;
}
</style>
