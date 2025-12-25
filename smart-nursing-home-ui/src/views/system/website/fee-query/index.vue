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
      <el-form-item label="查询类型" prop="queryType">
        <el-select v-model="queryParams.queryType" placeholder="请选择查询类型" clearable>
          <el-option label="月度费用" value="monthly" />
          <el-option label="季度费用" value="quarterly" />
          <el-option label="年度费用" value="yearly" />
          <el-option label="自定义期间" value="custom" />
        </el-select>
      </el-form-item>
      <el-form-item label="查询状态" prop="queryStatus">
        <el-select v-model="queryParams.queryStatus" placeholder="请选择查询状态" clearable>
          <el-option label="待处理" value="0" />
          <el-option label="已处理" value="1" />
          <el-option label="已发送" value="2" />
        </el-select>
      </el-form-item>
      <el-form-item label="查询时间">
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
          v-hasPermi="['website:fee:add']"
        >新增查询</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          @click="handleAddFee"
          v-hasPermi="['website:fee:add']"
        >新增费用</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['website:fee:edit']"
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
          v-hasPermi="['website:fee:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:fee:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="feeQueryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" />
      <el-table-column label="查询类型" align="center" prop="queryType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.query_type" :value="scope.row.queryType"/>
        </template>
      </el-table-column>
      <el-table-column label="查询期间" align="center" prop="startDate" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.startDate }} 至 {{ scope.row.endDate }}</span>
        </template>
      </el-table-column>
      <el-table-column label="总费用" align="center" prop="totalAmount">
        <template slot-scope="scope">
          <span v-if="scope.row.totalAmount">¥{{ scope.row.totalAmount }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="已付费用" align="center" prop="paidAmount">
        <template slot-scope="scope">
          <span v-if="scope.row.paidAmount">¥{{ scope.row.paidAmount }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="未付费用" align="center" prop="unpaidAmount">
        <template slot-scope="scope">
          <span v-if="scope.row.unpaidAmount">¥{{ scope.row.unpaidAmount }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="查询状态" align="center" prop="queryStatus">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.queryStatus == '0'" type="warning">待处理</el-tag>
          <el-tag v-else-if="scope.row.queryStatus == '1'" type="success">已处理</el-tag>
          <el-tag v-else-if="scope.row.queryStatus == '2'" type="info">已发送</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="查询时间" align="center" prop="queryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.queryTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['website:fee:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:fee:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            :type="scope.row.queryStatus == '0' ? 'text' : 'primary'"
            :icon="scope.row.queryStatus == '0' ? 'el-icon-cpu' : 'el-icon-refresh'"
            @click="handleGenerate(scope.row)"
            v-hasPermi="['website:fee:process']"
          >{{ scope.row.queryStatus == '0' ? '生成明细' : '刷新明细' }}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-promotion"
            @click="handleSend(scope.row)"
            v-hasPermi="['website:fee:send']"
            v-if="scope.row.queryStatus == '1'"
          >发送</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:fee:remove']"
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

    <!-- 添加或修改费用查询对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="老人" prop="elderlyId">
          <el-select
            v-if="!form.queryId"
            v-model="form.elderlyId"
            placeholder="请选择老人"
            filterable
            remote
            :remote-method="searchElderly"
            :loading="elderlyLoading"
            @change="handleElderlyChange"
            @focus="loadElderlyList"
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
        <el-form-item label="查询类型" prop="queryType">
          <el-select v-model="form.queryType" placeholder="请选择查询类型">
            <el-option label="月度费用" value="monthly" />
            <el-option label="季度费用" value="quarterly" />
            <el-option label="年度费用" value="yearly" />
            <el-option label="自定义期间" value="custom" />
          </el-select>
        </el-form-item>
        <el-form-item label="开始日期" prop="startDate">
          <el-date-picker
            v-model="form.startDate"
            type="date"
            placeholder="选择开始日期"
            value-format="yyyy-MM-dd"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="结束日期" prop="endDate">
          <el-date-picker
            v-model="form.endDate"
            type="date"
            placeholder="选择结束日期"
            value-format="yyyy-MM-dd"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 新增费用对话框 -->
    <el-dialog :title="feeTitle" :visible.sync="feeOpen" width="500px" append-to-body>
      <el-form ref="feeForm" :model="feeForm" :rules="feeRules" label-width="80px">
        <el-form-item label="老人" prop="elderlyId">
          <el-select
            v-model="feeForm.elderlyId"
            placeholder="请选择老人"
            filterable
            remote
            :remote-method="searchElderly"
            :loading="elderlyLoading"
            @change="handleElderlyChange"
            @focus="loadElderlyList"
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
        </el-form-item>
        <el-form-item label="费用类型" prop="feeType">
          <el-select v-model="feeForm.feeType" placeholder="请选择费用类型">
            <el-option label="床位费" value="room" />
            <el-option label="餐饮费" value="meal" />
            <el-option label="医疗费" value="medical" />
            <el-option label="护理费" value="nursing" />
            <el-option label="其他费用" value="other" />
          </el-select>
        </el-form-item>
        <el-form-item label="费用名称" prop="feeName">
          <el-input v-model="feeForm.feeName" placeholder="请输入费用名称"></el-input>
        </el-form-item>
        <el-form-item label="费用金额" prop="feeAmount">
          <el-input-number v-model="feeForm.feeAmount" :precision="2" :min="0" placeholder="请输入费用金额" style="width: 100%"></el-input-number>
        </el-form-item>
        <el-form-item label="费用期间" prop="feeDateRange">
          <el-date-picker
            v-model="feeForm.feeDateRange"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            value-format="yyyy-MM-dd"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="生成方式" prop="generateType">
          <el-radio-group v-model="feeForm.generateType">
            <el-radio label="daily">按天生成（每天一条记录）</el-radio>
            <el-radio label="single">单条记录（整个期间一条记录）</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="支付状态" prop="isPaid">
          <el-radio-group v-model="feeForm.isPaid">
            <el-radio label="0">未付</el-radio>
            <el-radio label="1">已付</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="支付日期" prop="paidDate" v-if="feeForm.isPaid == '1'">
          <el-date-picker
            v-model="feeForm.paidDate"
            type="date"
            placeholder="选择支付日期"
            value-format="yyyy-MM-dd"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="支付方式" prop="paymentMethod" v-if="feeForm.isPaid == '1'">
          <el-select v-model="feeForm.paymentMethod" placeholder="请选择支付方式">
            <el-option label="现金" value="cash" />
            <el-option label="银行转账" value="bank_transfer" />
            <el-option label="微信支付" value="wechat" />
            <el-option label="支付宝" value="alipay" />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="feeForm.remark" type="textarea" placeholder="请输入备注"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFeeForm">确 定</el-button>
        <el-button @click="cancelFee">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 费用明细查看对话框 -->
    <el-dialog title="费用明细" :visible.sync="detailOpen" width="80%" append-to-body>
      <div style="margin-bottom: 20px;">
        <el-row :gutter="20">
          <el-col :span="8">
            <div class="fee-summary-item">
              <span class="label">查询期间：</span>
              <span class="value">{{ currentQueryPeriod }}</span>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="fee-summary-item">
              <span class="label">总费用：</span>
              <span class="value amount">¥{{ currentTotalAmount }}</span>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="fee-summary-item">
              <span class="label">已付费用：</span>
              <span class="value amount">¥{{ currentPaidAmount }}</span>
            </div>
          </el-col>
        </el-row>
      </div>
      
      <el-table :data="feeDetailList" v-loading="detailLoading">
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
        <el-table-column label="支付状态" align="center" prop="isPaid" width="100">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.isPaid == '0'" type="danger">未付</el-tag>
            <el-tag v-else type="success">已付</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="支付日期" align="center" prop="paidDate" width="120">
          <template slot-scope="scope">
            <span v-if="scope.row.paidDate">{{ formatDate(scope.row.paidDate) }}</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="支付方式" align="center" prop="paymentMethod" width="120">
          <template slot-scope="scope">
            <dict-tag v-if="scope.row.paymentMethod" :options="dict.type.payment_method" :value="scope.row.paymentMethod"/>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" prop="remark" min-width="150">
          <template slot-scope="scope">
            <span v-if="scope.row.remark">{{ scope.row.remark }}</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import { listFeeQuery, getFeeQuery, delFeeQuery, addFeeQuery, updateFeeQuery, processFeeQuery, sendFeeQuery, generateFeeDetails, getFeeDetailList, addFeeDetail } from "@/api/website/fee-query";
import { listElderlyInfo } from "@/api/website/elderly-info";

export default {
  name: "FeeQuery",
  dicts: ['query_type', 'fee_type', 'payment_method'],
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
      // 费用查询表格数据
      feeQueryList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        queryType: null,
        queryStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        elderlyId: [
          { required: true, message: "老人不能为空", trigger: "change" }
        ],
        queryType: [
          { required: true, message: "查询类型不能为空", trigger: "change" }
        ],
        startDate: [
          { required: true, message: "开始日期不能为空", trigger: "change" }
        ],
        endDate: [
          { required: true, message: "结束日期不能为空", trigger: "change" }
        ]
      },
      // 日期范围
      dateRange: [],
      // 老人选项
      elderlyOptions: [],
      elderlyLoading: false,
      // 费用明细相关
      detailOpen: false,
      detailLoading: false,
      feeDetailList: [],
      currentQueryPeriod: '',
      currentTotalAmount: 0,
      currentPaidAmount: 0,
      // 新增费用相关
      feeOpen: false,
      feeTitle: "",
      feeForm: {},
      feeRules: {
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
        feeDateRange: [
          { required: true, message: "费用期间不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询费用查询列表 */
    getList() {
      this.loading = true;
      listFeeQuery(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.feeQueryList = response.rows;
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
        queryId: null,
        elderlyId: null,
        elderlyName: null,
        queryType: null,
        startDate: null,
        endDate: null,
        queryStatus: null,
        queryResult: null,
        totalAmount: null,
        paidAmount: null,
        unpaidAmount: null,
        queryBy: null,
        queryTime: null,
        processBy: null,
        processTime: null,
        sendTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    // 费用表单重置
    resetFee() {
      this.feeForm = {
        detailId: null,
        elderlyId: null,
        elderlyName: null,
        feeType: null,
        feeName: null,
        feeAmount: null,
        feeDateRange: null,
        feeDate: null,
        feeMonth: null,
        generateType: 'daily',
        isPaid: '0',
        paidDate: null,
        paymentMethod: null,
        remark: null
      };
      this.resetForm("feeForm");
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
      this.ids = selection.map(item => item.queryId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增查询按钮操作 */
    handleAdd() {
      this.reset();
      this.loadElderlyList();
      this.open = true;
      this.title = "添加费用查询";
    },
    /** 新增费用按钮操作 */
    handleAddFee() {
      this.resetFee();
      this.loadElderlyList();
      this.feeOpen = true;
      this.feeTitle = "新增费用";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const queryId = row.queryId || this.ids
      getFeeQuery(queryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改费用查询";
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.detailOpen = true;
      this.detailLoading = true;
      this.feeDetailList = [];
      
      // 设置查询期间和金额信息
      this.currentQueryPeriod = `${row.startDate} 至 ${row.endDate}`;
      this.currentTotalAmount = row.totalAmount || 0;
      this.currentPaidAmount = row.paidAmount || 0;
      
      // 调用API获取费用明细
      getFeeDetailList(row.queryId).then(response => {
        this.feeDetailList = response.data || [];
        this.detailLoading = false;
      }).catch(() => {
        this.detailLoading = false;
        this.$modal.msgError("获取费用明细失败");
      });
    },
    /** 生成明细按钮操作 */
    handleGenerate(row) {
      const actionText = row.queryStatus == '0' ? '生成' : '刷新';
      this.$modal.confirm(`是否确认${actionText}该查询的费用明细？`).then(function() {
        return generateFeeDetails(row.queryId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(`${actionText}成功`);
      }).catch(() => {});
    },
    /** 发送按钮操作 */
    handleSend(row) {
      this.$modal.confirm('是否确认发送该费用查询？').then(function() {
        return sendFeeQuery(row.queryId);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("发送成功");
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.queryId != null) {
            updateFeeQuery(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFeeQuery(this.form).then(response => {
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
      const queryIds = row.queryId || this.ids;
      this.$modal.confirm('是否确认删除费用查询编号为"' + queryIds + '"的数据项？').then(function() {
        return delFeeQuery(queryIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/feeQuery/export', {
        ...this.queryParams
      }, `feeQuery_${new Date().getTime()}.xlsx`)
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
    },
    // 费用表单取消
    cancelFee() {
      this.feeOpen = false;
      this.resetFee();
    },
    // 费用表单提交
    submitFeeForm() {
      this.$refs["feeForm"].validate(valid => {
        if (valid) {
          if (!this.feeForm.feeDateRange || this.feeForm.feeDateRange.length !== 2) {
            this.$modal.msgError("请选择费用期间");
            return;
          }
          
          const startDate = this.feeForm.feeDateRange[0];
          const endDate = this.feeForm.feeDateRange[1];
          
          if (this.feeForm.generateType === 'daily') {
            // 按天生成
            const start = new Date(startDate);
            const end = new Date(endDate);
            const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24)) + 1;
            
            this.$modal.confirm(`将为 ${startDate} 至 ${endDate} 期间（共${days}天）按天生成费用记录，是否继续？`).then(() => {
              this.generateDailyFees(startDate, endDate, days);
            }).catch(() => {});
          } else {
            // 单条记录
            this.$modal.confirm(`将为 ${startDate} 至 ${endDate} 期间生成一条费用记录，是否继续？`).then(() => {
              this.generateSingleFee(startDate, endDate);
            }).catch(() => {});
          }
        }
      });
    },
    // 按天生成费用
    generateDailyFees(startDate, endDate, days) {
      const promises = [];
      
      // 解析开始日期
      const [startYear, startMonth, startDay] = startDate.split('-').map(Number);
      
      for (let i = 0; i < days; i++) {
        // 直接计算日期，避免时区问题
        const currentDate = new Date(startYear, startMonth - 1, startDay + i);
        
        // 格式化为 YYYY-MM-DD
        const year = currentDate.getFullYear();
        const month = String(currentDate.getMonth() + 1).padStart(2, '0');
        const day = String(currentDate.getDate()).padStart(2, '0');
        const dateStr = `${year}-${month}-${day}`;
        
        const feeData = {
          elderlyId: this.feeForm.elderlyId,
          feeType: this.feeForm.feeType,
          feeName: this.feeForm.feeName,
          feeAmount: this.feeForm.feeAmount,
          feeDate: dateStr,
          isPaid: this.feeForm.isPaid,
          paidDate: this.feeForm.paidDate,
          paymentMethod: this.feeForm.paymentMethod,
          remark: this.feeForm.remark
        };
        
        promises.push(addFeeDetail(feeData));
      }
      
      Promise.all(promises).then(() => {
        this.$modal.msgSuccess(`成功添加 ${days} 条费用记录`);
        this.feeOpen = false;
        this.resetFee();
        this.getList();
      }).catch(() => {
        this.$modal.msgError("添加费用记录失败");
      });
    },
    // 生成单条费用
    generateSingleFee(startDate, endDate) {
      const feeData = {
        elderlyId: this.feeForm.elderlyId,
        feeType: this.feeForm.feeType,
        feeName: this.feeForm.feeName,
        feeAmount: this.feeForm.feeAmount,
        feeDate: startDate,
        endDate: endDate, // 设置结束日期
        isPaid: this.feeForm.isPaid,
        paidDate: this.feeForm.paidDate,
        paymentMethod: this.feeForm.paymentMethod,
        remark: this.feeForm.remark
      };
      
      addFeeDetail(feeData).then(() => {
        this.$modal.msgSuccess("成功添加费用记录");
        this.feeOpen = false;
        this.resetFee();
        this.getList();
      }).catch(() => {
        this.$modal.msgError("添加费用记录失败");
      });
    },
    // 格式化日期显示
    formatDate(dateStr) {
      if (!dateStr) return '-';
      // 直接返回日期字符串，避免时区转换
      return dateStr;
    }
  }
};
</script>

<style scoped>
.fee-summary-item {
  padding: 10px;
  background: #f5f7fa;
  border-radius: 4px;
  text-align: center;
}

.fee-summary-item .label {
  font-weight: bold;
  color: #606266;
  margin-right: 8px;
}

.fee-summary-item .value {
  color: #303133;
}

.fee-summary-item .value.amount {
  color: #e6a23c;
  font-weight: bold;
  font-size: 16px;
}

.amount {
  color: #e6a23c;
  font-weight: bold;
}
</style>
