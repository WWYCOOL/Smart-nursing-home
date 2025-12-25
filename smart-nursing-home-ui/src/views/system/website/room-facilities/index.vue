<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="房间名称" prop="facilityName">
        <el-input
          v-model="queryParams.facilityName"
          placeholder="请输入房间名称"
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
      <el-table-column label="房间图片" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="房间名称" align="center" prop="facilityName" />
      <el-table-column label="房间描述" align="center" prop="description" show-overflow-tooltip />
      <el-table-column label="房间面积" align="center" prop="area" />
      <el-table-column label="床位数量" align="center" prop="beds" />
      <el-table-column label="月费用" align="center" prop="price">
        <template slot-scope="scope">
          <span class="price-text">¥{{ scope.row.price }}</span>
        </template>
      </el-table-column>
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

    <!-- 添加或修改房间设施对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="房间名称" prop="facilityName">
              <el-input v-model="form.facilityName" placeholder="请输入房间名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="房间类型" prop="roomType">
              <el-select v-model="form.roomType" placeholder="请选择房间类型">
                <el-option label="单人间" value="single" />
                <el-option label="双人间" value="double" />
                <el-option label="三人间" value="triple" />
                <el-option label="四人间" value="quad" />
                <el-option label="豪华间" value="luxury" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-form-item label="房间描述" prop="description">
          <el-input v-model="form.description" type="textarea" :rows="3" placeholder="请输入房间描述" />
        </el-form-item>
        
        <el-form-item label="主图片" prop="imageUrl">
          <image-upload v-model="form.imageUrl"/>
        </el-form-item>
        
        <el-form-item label="房间特色" prop="features">
          <el-input v-model="form.features" type="textarea" :rows="2" placeholder="请输入房间特色，多个用逗号分隔" />
        </el-form-item>
        
        <el-row>
          <el-col :span="8">
            <el-form-item label="房间面积" prop="area">
              <el-input v-model="form.area" placeholder="如：25" @blur="formatArea">
                <template slot="append">㎡</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="床位数量" prop="beds">
              <el-input-number v-model="form.beds" :min="1" :max="4" controls-position="right" />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="月费用" prop="price">
              <el-input v-model="form.price" placeholder="如：3000" @blur="formatPrice">
                <template slot="prepend">¥</template>
                <template slot="append">元/月</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row>
          <el-col :span="12">
            <el-form-item label="朝向" prop="orientation">
              <el-select v-model="form.orientation" placeholder="请选择朝向">
                <el-option label="南向" value="south" />
                <el-option label="北向" value="north" />
                <el-option label="东向" value="east" />
                <el-option label="西向" value="west" />
                <el-option label="东南" value="southeast" />
                <el-option label="西南" value="southwest" />
                <el-option label="东北" value="northeast" />
                <el-option label="西北" value="northwest" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="楼层" prop="floor">
              <el-input-number v-model="form.floor" :min="1" :max="20" controls-position="right" />
            </el-form-item>
          </el-col>
        </el-row>
        
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
  name: "RoomFacilitiesManagement",
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
      // 房间设施表格数据
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
        facilityType: 'room', // 固定为房间类型
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        facilityName: [
          { required: true, message: "房间名称不能为空", trigger: "blur" }
        ],
        roomType: [
          { required: true, message: "房间类型不能为空", trigger: "change" }
        ],
        area: [
          { required: true, message: "房间面积不能为空", trigger: "blur" }
        ],
        beds: [
          { required: true, message: "床位数量不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "月费用不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询房间设施列表 */
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
        facilityType: 'room', // 固定为房间类型
        roomType: null,
        description: null,
        imageUrl: null,
        features: null,
        area: null,
        beds: null,
        price: null,
        orientation: null,
        floor: null,
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
      this.title = "添加房间设施";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const facilityId = row.facilityId || this.ids
      getFacilities(facilityId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改房间设施";
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
      this.$modal.confirm('是否确认删除房间设施编号为"' + facilityIds + '"的数据项？').then(function() {
        return delFacilities(facilityIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    
    /** 格式化面积字段 */
    formatArea() {
      if (this.form.area) {
        // 移除可能存在的单位
        let area = this.form.area.toString().replace(/[㎡平方米m2]/g, '').trim();
        
        // 检查是否为有效数字
        if (area && !isNaN(area) && parseFloat(area) > 0) {
          // 自动添加㎡单位
          this.form.area = area + '㎡';
        } else if (area) {
          // 如果不是有效数字，清空并提示
          this.form.area = '';
          this.$message.warning('请输入有效的面积数值');
        }
      }
    },
    
    /** 格式化价格字段 */
    formatPrice() {
      if (this.form.price) {
        // 移除可能存在的单位和符号
        let price = this.form.price.toString().replace(/[¥元/月]/g, '').trim();
        
        // 检查是否为有效数字
        if (price && !isNaN(price) && parseFloat(price) > 0) {
          // 自动添加元/月单位
          this.form.price = price + '元/月';
        } else if (price) {
          // 如果不是有效数字，清空并提示
          this.form.price = '';
          this.$message.warning('请输入有效的价格数值');
        }
      }
    }
  }
};
</script>

<style scoped>
.price-text {
  color: #e6a23c;
  font-weight: bold;
}
</style>




