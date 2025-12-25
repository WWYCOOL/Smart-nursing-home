<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入标题"
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
          v-hasPermi="['website:facility-overview:add']"
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
          v-hasPermi="['website:facility-overview:edit']"
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
          v-hasPermi="['website:facility-overview:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="overviewList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="概览图片" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="标题" align="center" prop="title" />
      <el-table-column label="描述" align="center" prop="description" show-overflow-tooltip />
      <el-table-column label="统计数据" align="center" prop="statsData" show-overflow-tooltip>
        <template slot-scope="scope">
          <div v-if="scope.row.statsData">
            <el-tag v-for="(value, key) in parseStats(scope.row.statsData)" :key="key" size="small" style="margin-right: 5px;">
              {{ getStatLabel(key) }}: {{ value }}
            </el-tag>
          </div>
        </template>
      </el-table-column>
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
            v-hasPermi="['website:facility-overview:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:facility-overview:remove']"
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

    <!-- 添加或修改环境概览配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题，如：温馨如家的居住环境" />
        </el-form-item>
        
        <el-form-item label="描述" prop="description">
          <el-input v-model="form.description" type="textarea" :rows="4" placeholder="请输入描述内容" />
        </el-form-item>
        
        <el-form-item label="概览图片" prop="imageUrl">
          <image-upload v-model="form.imageUrl"/>
        </el-form-item>
        
        <el-form-item label="统计数据" prop="statsData">
          <div class="stats-config">
            <div class="stat-item" v-for="(value, key) in statsConfig" :key="key">
              <el-row :gutter="10">
                <el-col :span="8">
                  <el-input v-model="statsConfig[key]" :placeholder="getStatLabel(key)" />
                </el-col>
                <el-col :span="4">
                  <span class="stat-label">{{ getStatLabel(key) }}</span>
                </el-col>
                <el-col :span="4">
                  <el-button type="danger" icon="el-icon-delete" size="mini" @click="removeStat(key)" v-if="Object.keys(statsConfig).length > 1">删除</el-button>
                </el-col>
              </el-row>
            </div>
            <el-button type="primary" icon="el-icon-plus" size="small" @click="addStat">添加统计项</el-button>
          </div>
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
import { listFacilityOverview, getFacilityOverview, delFacilityOverview, addFacilityOverview, updateFacilityOverview } from "@/api/website/facility-overview";

export default {
  name: "FacilityOverviewManagement",
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
      // 环境概览配置表格数据
      overviewList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        status: null
      },
      // 表单参数
      form: {},
      // 统计数据配置
      statsConfig: {},
      // 表单校验
      rules: {
        title: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
        description: [
          { required: true, message: "描述不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询环境概览配置列表 */
    getList() {
      this.loading = true;
      listFacilityOverview(this.queryParams).then(response => {
        this.overviewList = response.rows;
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
        overviewId: null,
        title: null,
        description: null,
        imageUrl: null,
        statsData: null,
        status: "0",
        remark: null
      };
      this.statsConfig = {
        beds: '',
        area: '',
        accessibility: ''
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
      this.ids = selection.map(item => item.overviewId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加环境概览配置";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const overviewId = row.overviewId || this.ids
      getFacilityOverview(overviewId).then(response => {
        this.form = response.data;
        // 解析统计数据
        if (this.form.statsData) {
          try {
            this.statsConfig = JSON.parse(this.form.statsData);
          } catch (e) {
            this.statsConfig = {};
          }
        } else {
          this.statsConfig = {
            beds: '',
            area: '',
            accessibility: ''
          };
        }
        this.open = true;
        this.title = "修改环境概览配置";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 将统计数据转换为JSON字符串
          const filteredStats = {};
          Object.keys(this.statsConfig).forEach(key => {
            if (this.statsConfig[key] && this.statsConfig[key].trim()) {
              filteredStats[key] = this.statsConfig[key].trim();
            }
          });
          this.form.statsData = JSON.stringify(filteredStats);
          
          if (this.form.overviewId != null) {
            updateFacilityOverview(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFacilityOverview(this.form).then(response => {
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
      const overviewIds = row.overviewId || this.ids;
      this.$modal.confirm('是否确认删除环境概览配置编号为"' + overviewIds + '"的数据项？').then(function() {
        return delFacilityOverview(overviewIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    
    // 解析统计数据
    parseStats(statsData) {
      if (!statsData) return {};
      try {
        return JSON.parse(statsData);
      } catch (e) {
        return {};
      }
    },
    
    // 获取统计标签
    getStatLabel(key) {
      const labelMap = {
        'beds': '专业床位',
        'area': '建筑面积',
        'accessibility': '无障碍设计'
      };
      return labelMap[key] || key;
    },
    
    // 添加统计项
    addStat() {
      const newKey = 'stat_' + Date.now();
      this.$set(this.statsConfig, newKey, '');
    },
    
    // 删除统计项
    removeStat(key) {
      this.$delete(this.statsConfig, key);
    }
  }
};
</script>

<style scoped>
.stats-config {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  padding: 15px;
}

.stat-item {
  margin-bottom: 10px;
}

.stat-item:last-child {
  margin-bottom: 0;
}

.stat-label {
  font-size: 14px;
  color: #606266;
  line-height: 32px;
}
</style>










