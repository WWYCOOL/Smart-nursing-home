<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="老人姓名" prop="elderlyName">
        <el-input
          v-model="queryParams.elderlyName"
          placeholder="请输入老人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="费用类型" prop="feeType">
        <el-select v-model="queryParams.feeType" placeholder="请选择费用类型" clearable>
          <el-option label="床位费" value="room" />
          <el-option label="餐饮费" value="meal" />
          <el-option label="医疗费" value="medical" />
          <el-option label="护理费" value="nursing" />
          <el-option label="其他费用" value="other" />
        </el-select>
      </el-form-item>
      <el-form-item label="支付状态" prop="isPaid">
        <el-select v-model="queryParams.isPaid" placeholder="请选择支付状态" clearable>
          <el-option label="未付" value="0" />
          <el-option label="已付" value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="费用日期">
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['website:feeDetail:add']"
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
          v-hasPermi="['website:feeDetail:edit']"
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
          v-hasPermi="['website:feeDetail:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:feeDetail:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-check"
          size="mini"
          :disabled="multiple"
          @click="handleBatchPaid"
          v-hasPermi="['website:feeDetail:batch']"
        >批量标记已付</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="feeDetailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" width="120" />
      <el-table-column label="费用类型" align="center" prop="feeType" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.fee_type" :value="scope.row.feeType"/>
        </template>
      </el-table-column>
      <el-table-column label="费用名称" align="center" prop="feeName" width="150" />
      <el-table-column label="费用金额" align="center" prop="feeAmount" width="120">
        <template slot-scope="scope">
          <span class="amount">¥{{ scope.row.feeAmount }}</span>
        </template>
      </el-table-column>
      <el-table-column label="费用日期" align="center" prop="feeDate" width="150">
        <template slot-scope="scope">
          <span v-if="scope.row.endDate">{{ formatDate(scope.row.feeDate) }} 至 {{ formatDate(scope.row.endDate) }}</span>
          <span v-else>{{ formatDate(scope.row.feeDate) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="费用月份" align="center" prop="feeMonth" width="100" />
      <el-table-column label="支付状态" align="center" prop="isPaid" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isPaid == '0'" type="danger">未付</el-tag>
          <el-tag v-else type="success">已付</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="支付日期" align="center" prop="paidDate" width="120" />
      <el-table-column label="支付方式" align="center" prop="paymentMethod" width="120">
        <template slot-scope="scope">
          <dict-tag v-if="scope.row.paymentMethod" :options="dict.type.payment_method" :value="scope.row.paymentMethod"/>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" min-width="150" show-overflow-tooltip />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['website:feeDetail:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:feeDetail:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleMarkPaid(scope.row)"
            v-hasPermi="['website:feeDetail:edit']"
            v-if="scope.row.isPaid == '0'"
          >标记已付</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-close"
            @click="handleMarkUnpaid(scope.row)"
            v-hasPermi="['website:feeDetail:edit']"
            v-if="scope.row.isPaid == '1'"
          >标记未付</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:feeDetail:remove']"
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

    <!-- 添加或修改费用明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="老人" prop="elderlyId">
          <el-select
            v-if="!form.detailId"
            v-model="form.elderlyId"
            placeholder="请选择老人"
            filterable
            remote
            :remote-method="searchElderly"
            :loading="elderlyLoading"
            @change="handleElderlyChange"
            @focus="loadElderlyList"
            :disabled="isViewMode"
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="item in elderlyOptions"
              :key="item.elderlyId"
              :label="`${item.elderlyName} (${item.roomNumber}-${item.bedNumber}) - ${item.idCard}`"
              :value="item.elderlyId"
            >
              <div style="display: flex; justify-content: space-between; align-items: center;">
                <div>
                  <div style="font-weight: bold;">{{ item.elderlyName }}</div>
                  <div style="color: #8492a6; font-size: 12px;">{{ item.roomNumber }}-{{ item.bedNumber }}</div>
                </div>
                <div style="color: #999; font-size: 11px; text-align: right;">
                  {{ item.idCard }}
                </div>
              </div>
            </el-option>
            <div v-if="elderlyOptions.length === 0 && !elderlyLoading" style="text-align: center; color: #999; padding: 10px;">
              暂无老人数据，请先添加老人信息
            </div>
          </el-select>
          <el-input
            v-else
            v-model="form.elderlyName"
            placeholder="老人姓名"
            disabled
            style="width: 100%"
          >
            <template slot="prepend">
              <i class="el-icon-user"></i>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item label="费用类型" prop="feeType">
          <el-select v-model="form.feeType" placeholder="请选择费用类型" :disabled="isViewMode">
            <el-option label="床位费" value="room" />
            <el-option label="餐饮费" value="meal" />
            <el-option label="医疗费" value="medical" />
            <el-option label="护理费" value="nursing" />
            <el-option label="其他费用" value="other" />
          </el-select>
        </el-form-item>
        <el-form-item label="费用名称" prop="feeName">
          <el-input v-model="form.feeName" placeholder="请输入费用名称" :disabled="isViewMode"></el-input>
        </el-form-item>
        <el-form-item label="费用金额" prop="feeAmount">
          <el-input-number v-model="form.feeAmount" :precision="2" :min="0" placeholder="请输入费用金额" :disabled="isViewMode" style="width: 100%"></el-input-number>
        </el-form-item>
        <el-form-item label="费用日期" prop="feeDate">
          <el-date-picker
            v-model="form.feeDate"
            type="date"
            placeholder="选择费用日期"
            value-format="yyyy-MM-dd"
            :disabled="isViewMode"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="支付状态" prop="isPaid">
          <el-radio-group v-model="form.isPaid" :disabled="isViewMode">
            <el-radio label="0">未付</el-radio>
            <el-radio label="1">已付</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="支付日期" prop="paidDate" v-if="form.isPaid == '1'">
          <el-date-picker
            v-model="form.paidDate"
            type="date"
            placeholder="选择支付日期"
            value-format="yyyy-MM-dd"
            :disabled="isViewMode"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="支付方式" prop="paymentMethod" v-if="form.isPaid == '1'">
          <el-select v-model="form.paymentMethod" placeholder="请选择支付方式" :disabled="isViewMode">
            <el-option label="现金" value="cash" />
            <el-option label="银行转账" value="bank" />
            <el-option label="微信支付" value="wechat" />
            <el-option label="支付宝" value="alipay" />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" :disabled="isViewMode"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button v-if="!isViewMode" type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">{{ isViewMode ? '关 闭' : '取 消' }}</el-button>
      </div>
    </el-dialog>

    <!-- 费用明细查看对话框 -->
    <el-dialog title="费用明细详情" :visible.sync="detailOpen" width="60%" append-to-body>
      <div style="margin-bottom: 20px;">
        <el-row :gutter="20">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">老人姓名：</span>
              <span class="value">{{ form.elderlyName || '-' }}</span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">费用类型：</span>
              <span class="value">
                <dict-tag :options="dict.type.fee_type" :value="form.feeType"/>
              </span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">费用名称：</span>
              <span class="value">{{ form.feeName || '-' }}</span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">费用金额：</span>
              <span class="value amount">¥{{ form.feeAmount || '0.00' }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">费用日期：</span>
              <span class="value">
                <span v-if="form.endDate">{{ formatDate(form.feeDate) }} 至 {{ formatDate(form.endDate) }}</span>
                <span v-else>{{ formatDate(form.feeDate) }}</span>
              </span>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">费用月份：</span>
              <span class="value">{{ form.feeMonth || '-' }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">支付状态：</span>
              <span class="value">
                <el-tag v-if="form.isPaid == '0'" type="danger">未付</el-tag>
                <el-tag v-else type="success">已付</el-tag>
              </span>
            </div>
          </el-col>
          <el-col :span="12" v-if="form.isPaid == '1'">
            <div class="detail-item">
              <span class="label">支付日期：</span>
              <span class="value">{{ formatDate(form.paidDate) }}</span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.isPaid == '1'">
          <el-col :span="12">
            <div class="detail-item">
              <span class="label">支付方式：</span>
              <span class="value">
                <dict-tag v-if="form.paymentMethod" :options="dict.type.payment_method" :value="form.paymentMethod"/>
                <span v-else>-</span>
              </span>
            </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" style="margin-top: 10px;" v-if="form.remark">
          <el-col :span="24">
            <div class="detail-item">
              <span class="label">备注：</span>
              <span class="value">{{ form.remark }}</span>
            </div>
          </el-col>
        </el-row>
      </div>
      
      <div slot="footer" class="dialog-footer">
        <el-button @click="detailOpen = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFeeDetail, getFeeDetail, delFeeDetail, addFeeDetail, updateFeeDetail, batchUpdatePayment } from "@/api/website/fee-detail";
import { listElderlyInfo } from "@/api/website/elderly-info";

export default {
  name: "FeeDetail",
  dicts: ['fee_type', 'payment_method'],
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
      // 费用明细表格数据
      feeDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示详情弹出层
      detailOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        feeType: null,
        isPaid: null,
      },
      // 表单参数
      form: {},
      // 查看模式标识
      isViewMode: false,
      // 表单校验
      rules: {
        elderlyId: [
          { required: true, message: "老人不能为空", trigger: "change" }
        ],
        feeType: [
          { required: true, message: "费用类型不能为空", trigger: "change" }
        ],
        feeName: [
          { required: true, message: "费用名称不能为空", trigger: "blur" }
        ],
        feeAmount: [
          { required: true, message: "费用金额不能为空", trigger: "blur" }
        ],
        feeDate: [
          { required: true, message: "费用日期不能为空", trigger: "change" }
        ]
      },
      // 日期范围
      dateRange: [],
      // 老人选项
      elderlyOptions: [],
      elderlyLoading: false
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 格式化日期 */
    formatDate(dateStr) {
      if (!dateStr) return '-';
      return dateStr;
    },
    /** 查询费用明细列表 */
    getList() {
      this.loading = true;
      listFeeDetail(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.feeDetailList = response.rows;
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
        detailId: null,
        elderlyId: null,
        elderlyName: null,
        feeType: null,
        feeName: null,
        feeAmount: null,
        feeDate: null,
        feeMonth: null,
        isPaid: '0',
        paidDate: null,
        paymentMethod: null,
        remark: null
      };
      this.isViewMode = false;
      this.resetForm("form");
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
      this.ids = selection.map(item => item.detailId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.isViewMode = false;
      this.loadElderlyList();
      this.open = true;
      this.title = "添加费用明细";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.isViewMode = false;
      const detailId = row.detailId || this.ids
      getFeeDetail(detailId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改费用明细";
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.form = { ...row };
      this.detailOpen = true;
    },
    /** 标记已付按钮操作 */
    handleMarkPaid(row) {
      this.$modal.confirm('是否确认标记该费用为已付？').then(() => {
        const updateData = {
          detailId: row.detailId,
          isPaid: '1',
          paidDate: new Date().toISOString().split('T')[0],
          paymentMethod: 'cash'
        };
        updateFeeDetail(updateData).then(() => {
          this.getList();
          this.$modal.msgSuccess("标记成功");
        });
      }).catch(() => {});
    },
    /** 标记未付按钮操作 */
    handleMarkUnpaid(row) {
      this.$modal.confirm('是否确认标记该费用为未付？').then(() => {
        const updateData = {
          detailId: row.detailId,
          isPaid: '0',
          paidDate: null,
          paymentMethod: null
        };
        updateFeeDetail(updateData).then(() => {
          this.getList();
          this.$modal.msgSuccess("标记成功");
        });
      }).catch(() => {});
    },
    /** 批量标记已付按钮操作 */
    handleBatchPaid() {
      if (this.ids.length === 0) {
        this.$modal.msgError("请选择要标记的费用明细");
        return;
      }
      
      this.$modal.confirm('是否确认批量标记选中的费用为已付？').then(() => {
        const updateData = this.ids.map(id => ({
          detailId: id,
          isPaid: '1',
          paidDate: new Date().toISOString().split('T')[0],
          paymentMethod: 'cash'
        }));
        
        batchUpdatePayment(updateData).then(() => {
          this.getList();
          this.$modal.msgSuccess("批量标记成功");
        });
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.detailId != null) {
            updateFeeDetail(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFeeDetail(this.form).then(response => {
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
      const detailIds = row.detailId || this.ids;
      this.$modal.confirm('是否确认删除费用明细编号为"' + detailIds + '"的数据项？').then(function() {
        return delFeeDetail(detailIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/feeDetail/export', {
        ...this.queryParams
      }, `feeDetail_${new Date().getTime()}.xlsx`)
    },
    /** 搜索老人 */
    searchElderly(query) {
      this.elderlyLoading = true;
      const params = {
        status: '0',
        pageNum: 1,
        pageSize: 20
      };
      
      if (query && query.trim() !== '') {
        if (/^\d{17}[\dXx]$/.test(query.trim())) {
          params.idCard = query.trim();
        } else {
          params.elderlyName = query.trim();
        }
      }
      
      listElderlyInfo(params).then(response => {
        this.elderlyOptions = response.rows || [];
        this.elderlyLoading = false;
      }).catch(() => {
        this.elderlyLoading = false;
      });
    },
    /** 选择老人 */
    handleElderlyChange(elderlyId) {
      const selectedElderly = this.elderlyOptions.find(item => item.elderlyId === elderlyId);
      if (selectedElderly) {
        this.form.elderlyName = selectedElderly.elderlyName;
      }
    },
    /** 加载老人列表 */
    loadElderlyList() {
      if (this.elderlyOptions.length === 0) {
        this.searchElderly('');
      }
    }
  }
};
</script>

<style scoped>
.amount {
  color: #e6a23c;
  font-weight: bold;
}

.detail-item {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.detail-item .label {
  font-weight: 600;
  color: #606266;
  min-width: 80px;
  margin-right: 10px;
}

.detail-item .value {
  color: #303133;
  flex: 1;
}

.detail-item .value.amount {
  color: #f56c6c;
  font-weight: bold;
  font-size: 16px;
}
</style>
