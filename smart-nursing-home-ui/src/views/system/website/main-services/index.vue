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
          v-hasPermi="['system:main-services:add']"
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
          v-hasPermi="['system:main-services:edit']"
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
          v-hasPermi="['system:main-services:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="mainServicesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="服务ID" align="center" prop="serviceId" />
      <el-table-column label="服务标题" align="center" prop="serviceTitle" />
      <el-table-column label="服务图标" align="center" prop="serviceIcon" width="80">
        <template slot-scope="scope">
          <i :class="scope.row.serviceIcon || 'el-icon-star-on'" style="font-size: 24px; color: #409EFF;"></i>
        </template>
      </el-table-column>
      <el-table-column label="服务描述" align="center" prop="serviceDescription" show-overflow-tooltip />
      <el-table-column label="服务价格" align="center" prop="servicePrice" />
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
            v-hasPermi="['system:main-services:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:main-services:remove']"
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

    <!-- 添加或修改主要服务项目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
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
                <i :class="form.serviceIcon || 'el-icon-star-on'" style="font-size: 20px; color: #409EFF;"></i>
              </div>
            </el-col>
          </el-row>
          <div class="icon-suggestions">
            <p>常用图标：</p>
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
        <el-form-item label="服务特色" prop="serviceFeatures">
          <el-input v-model="form.serviceFeatures" type="textarea" :rows="4" placeholder="请输入服务特色，每行一个特色" />
          <div class="form-tip">每行输入一个服务特色，系统会自动转换为JSON格式</div>
        </el-form-item>
        <el-form-item label="服务价格" prop="servicePrice">
          <el-input v-model="form.servicePrice" placeholder="请输入服务价格" />
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
import { listMainServices, getMainServices, delMainServices, addMainServices, updateMainServices } from "@/api/website/main-services";

export default {
  name: "MainServices",
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
      // 主要服务项目表格数据
      mainServicesList: [],
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
        'el-icon-user-solid', 'el-icon-first-aid-kit', 'el-icon-food',
        'el-icon-sunny', 'el-icon-chat-line-round', 'el-icon-phone',
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
        serviceFeatures: [
          { required: true, message: "服务特色不能为空", trigger: "blur" }
        ],
        servicePrice: [
          { required: true, message: "服务价格不能为空", trigger: "blur" }
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
    /** 查询主要服务项目列表 */
    getList() {
      this.loading = true;
      listMainServices(this.queryParams).then(response => {
        this.mainServicesList = response.rows;
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
        serviceIcon: 'el-icon-star-on',
        serviceDescription: null,
        serviceFeatures: null,
        servicePrice: null,
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
      this.title = "添加主要服务项目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const serviceId = row.serviceId || this.ids
      getMainServices(serviceId).then(response => {
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
        this.title = "修改主要服务项目";
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
            updateMainServices(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMainServices(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除主要服务项目编号为"' + serviceIds + '"的数据项？').then(function() {
        return delMainServices(serviceIds);
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
.form-tip {
  font-size: 12px;
  color: #909399;
  margin-top: 5px;
}
</style>








