<template>
  <div class="app-container">
    <el-tabs v-model="activeTab" type="card">
      <!-- 营养特色管理 -->
      <el-tab-pane label="营养特色管理" name="features">
        <div class="tab-content">
          <el-form :model="featureQueryParams" ref="featureQueryForm" size="small" :inline="true" v-show="featureShowSearch" label-width="68px">
            <el-form-item label="特色标题" prop="featureTitle">
              <el-input
                v-model="featureQueryParams.featureTitle"
                placeholder="请输入特色标题"
                clearable
                @keyup.enter.native="handleFeatureQuery"
              />
            </el-form-item>
            <el-form-item label="状态" prop="status">
              <el-select v-model="featureQueryParams.status" placeholder="请选择状态" clearable>
                <el-option
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleFeatureQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetFeatureQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button
                type="primary"
                plain
                icon="el-icon-plus"
                size="mini"
                @click="handleFeatureAdd"
                v-hasPermi="['website:nutrition:add']"
              >新增</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button
                type="success"
                plain
                icon="el-icon-edit"
                size="mini"
                :disabled="featureSingle"
                @click="handleFeatureUpdate"
                v-hasPermi="['website:nutrition:edit']"
              >修改</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button
                type="danger"
                plain
                icon="el-icon-delete"
                size="mini"
                :disabled="featureMultiple"
                @click="handleFeatureDelete"
                v-hasPermi="['website:nutrition:remove']"
              >删除</el-button>
            </el-col>
            <right-toolbar :showSearch.sync="featureShowSearch" @queryTable="getFeatureList"></right-toolbar>
          </el-row>

          <el-table v-loading="featureLoading" :data="featureList" @selection-change="handleFeatureSelectionChange">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="特色ID" align="center" prop="featureId" />
            <el-table-column label="特色标题" align="center" prop="featureTitle" />
            <el-table-column label="特色图标" align="center" prop="featureIcon" width="100">
              <template slot-scope="scope">
                <i :class="scope.row.featureIcon" style="font-size: 20px;"></i>
              </template>
            </el-table-column>
            <el-table-column label="特色描述" align="center" prop="featureDescription" show-overflow-tooltip />
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
                  @click="handleFeatureUpdate(scope.row)"
                  v-hasPermi="['website:nutrition:edit']"
                >修改</el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleFeatureDelete(scope.row)"
                  v-hasPermi="['website:nutrition:remove']"
                >删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-tab-pane>

      <!-- 今日菜单管理 -->
      <el-tab-pane label="今日菜单管理" name="menu">
        <div class="tab-content">
          <el-form :model="menuQueryParams" ref="menuQueryForm" size="small" :inline="true" v-show="menuShowSearch" label-width="68px">
            <el-form-item label="餐次名称" prop="mealName">
              <el-input
                v-model="menuQueryParams.mealName"
                placeholder="请输入餐次名称"
                clearable
                @keyup.enter.native="handleMenuQuery"
              />
            </el-form-item>
            <el-form-item label="状态" prop="status">
              <el-select v-model="menuQueryParams.status" placeholder="请选择状态" clearable>
                <el-option
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleMenuQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetMenuQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button
                type="primary"
                plain
                icon="el-icon-plus"
                size="mini"
                @click="handleMenuAdd"
                v-hasPermi="['website:nutrition:add']"
              >新增</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button
                type="success"
                plain
                icon="el-icon-edit"
                size="mini"
                :disabled="menuSingle"
                @click="handleMenuUpdate"
                v-hasPermi="['website:nutrition:edit']"
              >修改</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button
                type="danger"
                plain
                icon="el-icon-delete"
                size="mini"
                :disabled="menuMultiple"
                @click="handleMenuDelete"
                v-hasPermi="['website:nutrition:remove']"
              >删除</el-button>
            </el-col>
            <right-toolbar :showSearch.sync="menuShowSearch" @queryTable="getMenuList"></right-toolbar>
          </el-row>

          <el-table v-loading="menuLoading" :data="menuList" @selection-change="handleMenuSelectionChange">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="菜单ID" align="center" prop="menuId" />
            <el-table-column label="用餐时间" align="center" prop="mealTime" />
            <el-table-column label="餐次名称" align="center" prop="mealName" />
            <el-table-column label="菜品信息" align="center" prop="menuDishes" show-overflow-tooltip />
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
                  @click="handleMenuUpdate(scope.row)"
                  v-hasPermi="['website:nutrition:edit']"
                >修改</el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleMenuDelete(scope.row)"
                  v-hasPermi="['website:nutrition:remove']"
                >删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-tab-pane>
    </el-tabs>

    <!-- 营养特色对话框 -->
    <el-dialog :title="featureTitle" :visible.sync="featureOpen" width="600px" append-to-body>
      <el-form ref="featureForm" :model="featureForm" :rules="featureRules" label-width="100px">
        <el-form-item label="特色标题" prop="featureTitle">
          <el-input v-model="featureForm.featureTitle" placeholder="请输入特色标题" />
        </el-form-item>
        <el-form-item label="特色图标" prop="featureIcon">
          <el-input v-model="featureForm.featureIcon" placeholder="请输入特色图标" />
          <div style="margin-top: 10px;">
            <span style="color: #999; font-size: 12px;">常用图标：</span>
            <el-tag v-for="icon in iconOptions" :key="icon" @click="selectFeatureIcon(icon)" style="margin: 2px; cursor: pointer;">
              <i :class="icon"></i>
            </el-tag>
          </div>
        </el-form-item>
        <el-form-item label="特色描述" prop="featureDescription">
          <el-input v-model="featureForm.featureDescription" type="textarea" placeholder="请输入特色描述" />
        </el-form-item>
        <el-form-item label="显示顺序" prop="sortOrder">
          <el-input-number v-model="featureForm.sortOrder" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="featureForm.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="featureForm.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFeatureForm">确 定</el-button>
        <el-button @click="cancelFeature">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 今日菜单对话框 -->
    <el-dialog :title="menuTitle" :visible.sync="menuOpen" width="800px" append-to-body>
      <el-form ref="menuForm" :model="menuForm" :rules="menuRules" label-width="100px">
        <el-form-item label="用餐时间" prop="mealTime">
          <el-input v-model="menuForm.mealTime" placeholder="请输入用餐时间" />
        </el-form-item>
        <el-form-item label="餐次名称" prop="mealName">
          <el-input v-model="menuForm.mealName" placeholder="请输入餐次名称" />
        </el-form-item>
        <el-form-item label="菜品信息" prop="menuDishes">
          <div style="border: 1px solid #dcdfe6; border-radius: 4px; padding: 10px;">
            <div v-for="(dish, index) in dishList" :key="index" style="margin-bottom: 10px; display: flex; align-items: center;">
              <el-input v-model="dish.name" placeholder="菜品名称" style="width: 200px; margin-right: 10px;" />
              <el-input v-model="dish.nutrition" placeholder="营养成分" style="width: 200px; margin-right: 10px;" />
              <el-button type="danger" icon="el-icon-delete" size="mini" @click="removeDish(index)" v-if="dishList.length > 1"></el-button>
            </div>
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="addDish">添加菜品</el-button>
          </div>
        </el-form-item>
        <el-form-item label="显示顺序" prop="sortOrder">
          <el-input-number v-model="menuForm.sortOrder" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="menuForm.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="menuForm.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitMenuForm">确 定</el-button>
        <el-button @click="cancelMenu">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listNutritionFeatures, getNutritionFeatures, delNutritionFeatures, addNutritionFeatures, updateNutritionFeatures } from "@/api/website/nutrition-features";
import { listNutritionMenu, getNutritionMenu, delNutritionMenu, addNutritionMenu, updateNutritionMenu } from "@/api/website/nutrition-menu";

export default {
  name: "NutritionServices",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 当前激活的标签页
      activeTab: 'features',
      
      // 营养特色相关
      featureLoading: true,
      featureIds: [],
      featureSingle: true,
      featureMultiple: true,
      featureShowSearch: true,
      featureList: [],
      featureTitle: "",
      featureOpen: false,
      featureQueryParams: {
        pageNum: 1,
        pageSize: 10,
        featureTitle: null,
        status: null
      },
      featureForm: {},
      featureRules: {
        featureTitle: [
          { required: true, message: "特色标题不能为空", trigger: "blur" }
        ],
        featureDescription: [
          { required: true, message: "特色描述不能为空", trigger: "blur" }
        ]
      },
      
      // 今日菜单相关
      menuLoading: true,
      menuIds: [],
      menuSingle: true,
      menuMultiple: true,
      menuShowSearch: true,
      menuList: [],
      menuTitle: "",
      menuOpen: false,
      menuQueryParams: {
        pageNum: 1,
        pageSize: 10,
        mealName: null,
        status: null
      },
      menuForm: {},
      menuRules: {
        mealTime: [
          { required: true, message: "用餐时间不能为空", trigger: "blur" }
        ],
        mealName: [
          { required: true, message: "餐次名称不能为空", trigger: "blur" }
        ]
      },
      
      // 菜品列表
      dishList: [{ name: '', nutrition: '' }],
      
      // 图标选项
      iconOptions: [
        'el-icon-user',
        'el-icon-check',
        'el-icon-food',
        'el-icon-data-analysis',
        'el-icon-star-on',
        'el-icon-medicine',
        'el-icon-heart',
        'el-icon-lock'
      ]
    };
  },
  created() {
    this.getFeatureList();
    this.getMenuList();
  },
  methods: {
    // ========== 营养特色相关方法 ==========
    /** 查询营养特色列表 */
    getFeatureList() {
      this.featureLoading = true;
      listNutritionFeatures(this.featureQueryParams).then(response => {
        this.featureList = response.rows;
        this.featureLoading = false;
      });
    },
    
    /** 搜索按钮操作 */
    handleFeatureQuery() {
      this.featureQueryParams.pageNum = 1;
      this.getFeatureList();
    },
    
    /** 重置按钮操作 */
    resetFeatureQuery() {
      this.resetForm("featureQueryForm");
      this.handleFeatureQuery();
    },
    
    // 多选框选中数据
    handleFeatureSelectionChange(selection) {
      this.featureIds = selection.map(item => item.featureId)
      this.featureSingle = selection.length!==1
      this.featureMultiple = !selection.length
    },
    
    /** 新增按钮操作 */
    handleFeatureAdd() {
      this.resetFeature();
      this.featureOpen = true;
      this.featureTitle = "添加营养特色";
    },
    
    /** 修改按钮操作 */
    handleFeatureUpdate(row) {
      this.resetFeature();
      const featureId = row.featureId || this.featureIds
      getNutritionFeatures(featureId).then(response => {
        this.featureForm = response.data;
        this.featureOpen = true;
        this.featureTitle = "修改营养特色";
      });
    },
    
    /** 提交按钮 */
    submitFeatureForm() {
      this.$refs["featureForm"].validate(valid => {
        if (valid) {
          if (this.featureForm.featureId != null) {
            updateNutritionFeatures(this.featureForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.featureOpen = false;
              this.getFeatureList();
            });
          } else {
            addNutritionFeatures(this.featureForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.featureOpen = false;
              this.getFeatureList();
            });
          }
        }
      });
    },
    
    /** 删除按钮操作 */
    handleFeatureDelete(row) {
      const featureIds = row.featureId || this.featureIds;
      this.$modal.confirm('是否确认删除营养特色编号为"' + featureIds + '"的数据项？').then(function() {
        return delNutritionFeatures(featureIds);
      }).then(() => {
        this.getFeatureList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    
    // 表单重置
    resetFeature() {
      this.featureForm = {
        featureId: null,
        featureTitle: null,
        featureIcon: null,
        featureDescription: null,
        sortOrder: 0,
        status: "0",
        remark: null
      };
      this.resetForm("featureForm");
    },
    
    cancelFeature() {
      this.featureOpen = false;
      this.resetFeature();
    },
    
    /** 选择图标 */
    selectFeatureIcon(icon) {
      this.featureForm.featureIcon = icon;
    },
    
    // ========== 今日菜单相关方法 ==========
    /** 查询今日菜单列表 */
    getMenuList() {
      this.menuLoading = true;
      listNutritionMenu(this.menuQueryParams).then(response => {
        this.menuList = response.rows;
        this.menuLoading = false;
      });
    },
    
    /** 搜索按钮操作 */
    handleMenuQuery() {
      this.menuQueryParams.pageNum = 1;
      this.getMenuList();
    },
    
    /** 重置按钮操作 */
    resetMenuQuery() {
      this.resetForm("menuQueryForm");
      this.handleMenuQuery();
    },
    
    // 多选框选中数据
    handleMenuSelectionChange(selection) {
      this.menuIds = selection.map(item => item.menuId)
      this.menuSingle = selection.length!==1
      this.menuMultiple = !selection.length
    },
    
    /** 新增按钮操作 */
    handleMenuAdd() {
      this.resetMenu();
      this.menuOpen = true;
      this.menuTitle = "添加今日菜单";
    },
    
    /** 修改按钮操作 */
    handleMenuUpdate(row) {
      this.resetMenu();
      const menuId = row.menuId || this.menuIds
      getNutritionMenu(menuId).then(response => {
        this.menuForm = response.data;
        // 解析菜品信息
        if (this.menuForm.menuDishes) {
          try {
            this.dishList = JSON.parse(this.menuForm.menuDishes);
          } catch (e) {
            this.dishList = [{ name: '', nutrition: '' }];
          }
        } else {
          this.dishList = [{ name: '', nutrition: '' }];
        }
        this.menuOpen = true;
        this.menuTitle = "修改今日菜单";
      });
    },
    
    /** 提交按钮 */
    submitMenuForm() {
      this.$refs["menuForm"].validate(valid => {
        if (valid) {
          // 将菜品列表转换为JSON字符串
          this.menuForm.menuDishes = JSON.stringify(this.dishList);
          
          if (this.menuForm.menuId != null) {
            updateNutritionMenu(this.menuForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.menuOpen = false;
              this.getMenuList();
            });
          } else {
            addNutritionMenu(this.menuForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.menuOpen = false;
              this.getMenuList();
            });
          }
        }
      });
    },
    
    /** 删除按钮操作 */
    handleMenuDelete(row) {
      const menuIds = row.menuId || this.menuIds;
      this.$modal.confirm('是否确认删除今日菜单编号为"' + menuIds + '"的数据项？').then(function() {
        return delNutritionMenu(menuIds);
      }).then(() => {
        this.getMenuList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    
    // 表单重置
    resetMenu() {
      this.menuForm = {
        menuId: null,
        mealTime: null,
        mealName: null,
        menuDishes: null,
        sortOrder: 0,
        status: "0",
        remark: null
      };
      this.dishList = [{ name: '', nutrition: '' }];
      this.resetForm("menuForm");
    },
    
    cancelMenu() {
      this.menuOpen = false;
      this.resetMenu();
    },
    
    /** 添加菜品 */
    addDish() {
      this.dishList.push({ name: '', nutrition: '' });
    },
    
    /** 删除菜品 */
    removeDish(index) {
      this.dishList.splice(index, 1);
    }
  }
};
</script>

<style scoped>
.tab-content {
  padding: 20px 0;
}
</style>



