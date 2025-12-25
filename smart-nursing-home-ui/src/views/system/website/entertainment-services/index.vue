<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类名称" prop="categoryName">
        <el-input
          v-model="queryParams.categoryName"
          placeholder="请输入分类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="活动名称" prop="activityName">
        <el-input
          v-model="queryParams.activityName"
          placeholder="请输入活动名称"
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
          v-hasPermi="['website:entertainment:add']"
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
          v-hasPermi="['website:entertainment:edit']"
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
          v-hasPermi="['website:entertainment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:entertainment:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="entertainmentServicesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="活动ID" align="center" prop="activityId" />
      <el-table-column label="活动分类" align="center" width="150">
        <template slot-scope="scope">
          <div style="display: flex; align-items: center; justify-content: center;">
            <i :class="scope.row.categoryIcon" style="font-size: 16px; margin-right: 5px;"></i>
            <span>{{ scope.row.categoryName }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="活动名称" align="center" prop="activityName" />
      <el-table-column label="活动描述" align="center" prop="activityDescription" show-overflow-tooltip />
      <el-table-column label="活动时间" align="center" prop="activityTime" width="180" />
      <el-table-column label="活动地点" align="center" prop="activityLocation" />
      <el-table-column label="显示顺序" align="center" prop="sortOrder" />
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
            v-hasPermi="['website:entertainment:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:entertainment:remove']"
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

    <!-- 添加或修改文娱活动服务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="活动分类" prop="categoryId">
          <el-select v-model="form.categoryId" placeholder="请选择活动分类" @change="handleCategoryChange" style="width: 100%;">
            <el-option
              v-for="category in categoryOptions"
              :key="category.id"
              :label="category.name"
              :value="category.id">
              <span style="float: left">
                <i :class="category.icon" style="margin-right: 8px;"></i>
                {{ category.name }}
              </span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="活动名称" prop="activityName">
          <el-input v-model="form.activityName" placeholder="请输入活动名称" />
        </el-form-item>
        <el-form-item label="活动描述" prop="activityDescription">
          <el-input v-model="form.activityDescription" type="textarea" placeholder="请输入活动描述" />
        </el-form-item>
        <el-form-item label="活动时间" prop="activityTime">
          <el-input v-model="form.activityTime" placeholder="请输入活动时间" />
        </el-form-item>
        <el-form-item label="活动地点" prop="activityLocation">
          <el-input v-model="form.activityLocation" placeholder="请输入活动地点" />
        </el-form-item>
        <el-form-item label="活动图片" prop="activityImage">
          <el-input v-model="form.activityImage" placeholder="请输入活动图片URL" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="sortOrder">
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
import { listEntertainmentServices, getEntertainmentServices, delEntertainmentServices, addEntertainmentServices, updateEntertainmentServices } from "@/api/website/entertainment-services";

export default {
  name: "EntertainmentServices",
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
      // 文娱活动服务表格数据
      entertainmentServicesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryName: null,
        activityName: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "分类ID不能为空", trigger: "blur" }
        ],
        categoryName: [
          { required: true, message: "分类名称不能为空", trigger: "blur" }
        ],
        activityName: [
          { required: true, message: "活动名称不能为空", trigger: "blur" }
        ],
        activityDescription: [
          { required: true, message: "活动描述不能为空", trigger: "blur" }
        ],
        activityTime: [
          { required: true, message: "活动时间不能为空", trigger: "blur" }
        ],
        activityLocation: [
          { required: true, message: "活动地点不能为空", trigger: "blur" }
        ]
      },
      // 分类选项
      categoryOptions: [
        { id: 1, name: '文化艺术', icon: 'el-icon-edit' },
        { id: 2, name: '体育运动', icon: 'el-icon-basketball' },
        { id: 3, name: '娱乐游戏', icon: 'el-icon-trophy' },
        { id: 4, name: '音乐舞蹈', icon: 'el-icon-music' },
        { id: 5, name: '手工制作', icon: 'el-icon-goods' },
        { id: 6, name: '阅读学习', icon: 'el-icon-reading' },
        { id: 7, name: '户外活动', icon: 'el-icon-location' },
        { id: 8, name: '社交聚会', icon: 'el-icon-user' }
      ]
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文娱活动服务列表 */
    getList() {
      this.loading = true;
      listEntertainmentServices(this.queryParams).then(response => {
        this.entertainmentServicesList = response.rows;
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
        activityId: null,
        categoryId: null,
        categoryName: null,
        categoryIcon: null,
        activityName: null,
        activityDescription: null,
        activityTime: null,
        activityLocation: null,
        activityImage: null,
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
      this.ids = selection.map(item => item.activityId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文娱活动服务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const activityId = row.activityId || this.ids
      getEntertainmentServices(activityId).then(response => {
        this.form = response.data;
        // 确保分类信息正确设置
        if (this.form.categoryId) {
          const category = this.categoryOptions.find(item => item.id === this.form.categoryId);
          if (category) {
            this.form.categoryName = category.name;
            this.form.categoryIcon = category.icon;
          }
        }
        this.open = true;
        this.title = "修改文娱活动服务";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.activityId != null) {
            updateEntertainmentServices(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEntertainmentServices(this.form).then(response => {
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
      const activityIds = row.activityId || this.ids;
      this.$modal.confirm('是否确认删除文娱活动服务编号为"' + activityIds + '"的数据项？').then(function() {
        return delEntertainmentServices(activityIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/entertainment-services/export', {
        ...this.queryParams
      }, `entertainment_services_${new Date().getTime()}.xlsx`)
    },
    /** 分类变化处理 */
    handleCategoryChange(categoryId) {
      const category = this.categoryOptions.find(item => item.id === categoryId);
      if (category) {
        this.form.categoryName = category.name;
        this.form.categoryIcon = category.icon;
      }
    }
  }
};
</script>




