<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备名称" prop="facilityName">
        <el-input
          v-model="queryParams.facilityName"
          placeholder="请输入设备名称"
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
          v-hasPermi="['system:facilities:add']"
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
          v-hasPermi="['system:facilities:edit']"
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
          v-hasPermi="['system:facilities:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="facilitiesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="设备图标" align="center" prop="iconClass" width="80">
        <template slot-scope="scope">
          <i :class="scope.row.iconClass || 'el-icon-first-aid-kit'" style="font-size: 24px; color: #409EFF;"></i>
        </template>
      </el-table-column>
      <el-table-column label="设备名称" align="center" prop="facilityName" />
      <el-table-column label="设备描述" align="center" prop="description" show-overflow-tooltip />
      <el-table-column label="设备功能" align="center" prop="features" show-overflow-tooltip />
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
            v-hasPermi="['system:facilities:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:facilities:remove']"
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

    <!-- 添加或修改医疗设施对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="设备名称" prop="facilityName">
          <el-input v-model="form.facilityName" placeholder="请输入设备名称" />
        </el-form-item>
        
        <el-form-item label="设备描述" prop="description">
          <el-input v-model="form.description" type="textarea" :rows="3" placeholder="请输入设备描述" />
        </el-form-item>
        
        <el-form-item label="设备图标" prop="iconClass">
          <el-row :gutter="10">
            <el-col :span="12">
              <el-input v-model="form.iconClass" placeholder="请输入图标类名" />
            </el-col>
            <el-col :span="12">
              <div class="icon-preview">
                <span>预览：</span>
                <i :class="form.iconClass || 'el-icon-first-aid-kit'" style="font-size: 20px; color: #409EFF;"></i>
              </div>
            </el-col>
          </el-row>
          <div class="icon-suggestions">
            <p>常用图标：</p>
            <div class="icon-list">
              <span v-for="icon in iconSuggestions" :key="icon" @click="form.iconClass = icon" class="icon-item">
                <i :class="icon"></i>
              </span>
            </div>
          </div>
        </el-form-item>
        
        <el-form-item label="设备图片" prop="imageUrl">
          <image-upload v-model="form.imageUrl"/>
        </el-form-item>
        
        <el-form-item label="设备功能" prop="features">
          <el-input v-model="form.features" type="textarea" :rows="2" placeholder="请输入设备功能，多个用逗号分隔" />
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
import { listFacilities, getFacilities, delFacilities, addFacilities, updateFacilities } from "@/api/website/facilities";

export default {
  name: "MedicalFacilitiesManagement",
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
      // 医疗设施表格数据
      facilitiesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        facilityName: null,
        facilityType: 'medical', // 固定为医疗设施类型
        status: null
      },
      // 表单参数
      form: {},
      // 图标建议
      iconSuggestions: [
        'el-icon-first-aid-kit', 'el-icon-medicine-box', 'el-icon-thermometer',
        'el-icon-microphone', 'el-icon-cpu', 'el-icon-monitor',
        'el-icon-connection', 'el-icon-setting', 'el-icon-tools'
      ],
      // 表单校验
      rules: {
        facilityName: [
          { required: true, message: "设备名称不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询医疗设施列表 */
    getList() {
      this.loading = true;
      listFacilities(this.queryParams).then(response => {
        this.facilitiesList = response.rows;
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
        facilityId: null,
        facilityName: null,
        facilityType: 'medical', // 固定为医疗设施类型
        description: null,
        iconClass: 'el-icon-first-aid-kit',
        imageUrl: null,
        features: null,
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
      this.ids = selection.map(item => item.facilityId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加医疗设备";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const facilityId = row.facilityId || this.ids
      getFacilities(facilityId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改医疗设备";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.facilityId != null) {
            updateFacilities(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFacilities(this.form).then(response => {
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
      const facilityIds = row.facilityId || this.ids;
      this.$modal.confirm('是否确认删除医疗设备编号为"' + facilityIds + '"的数据项？').then(function() {
        return delFacilities(facilityIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>


