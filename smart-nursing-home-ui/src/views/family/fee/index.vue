<template>
  <div class="family-fee">
    <!-- 页面标题 -->
    <div class="page-header">
      <h1>费用查询</h1>
      <el-button type="primary" @click="goToDashboard">返回首页</el-button>
    </div>

    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <div class="loading-content">
        <i class="el-icon-loading"></i>
        <p>加载中...</p>
      </div>
    </div>

    <!-- 费用查询界面 -->
    <div class="fee-container" v-if="!loading">
      <!-- 老人信息 -->
      <div class="elderly-info">
        <div class="info-card">
          <div class="info-header">
            <h3>老人信息</h3>
          </div>
          <div class="info-content">
            <div class="info-item">
              <span class="label">姓名：</span>
              <span class="value">{{ elderlyInfo ? elderlyInfo.elderlyName : '未知' }}</span>
            </div>
            <div class="info-item">
              <span class="label">房间号：</span>
              <span class="value">{{ elderlyInfo ? elderlyInfo.roomNumber : '未知' }}</span>
            </div>
            <div class="info-item">
              <span class="label">入住时间：</span>
              <span class="value">{{ elderlyInfo ? formatDate(elderlyInfo.admissionDate) : '未知' }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- 费用统计 -->
      <div class="fee-statistics">
        <div class="statistics-card">
          <div class="statistics-header">
            <h3>费用统计</h3>
            <div class="date-range">
              <el-date-picker
                v-model="dateRange"
                type="monthrange"
                range-separator="至"
                start-placeholder="开始月份"
                end-placeholder="结束月份"
                value-format="yyyy-MM"
                @change="handleDateChange"
              >
              </el-date-picker>
            </div>
          </div>
          <div class="statistics-content">
            <div class="stat-item">
              <div class="stat-label">总费用</div>
              <div class="stat-value total">¥{{ statistics.totalAmount || '0.00' }}</div>
            </div>
            <div class="stat-item">
              <div class="stat-label">已付费用</div>
              <div class="stat-value paid">¥{{ statistics.paidAmount || '0.00' }}</div>
            </div>
            <div class="stat-item">
              <div class="stat-label">未付费用</div>
              <div class="stat-value unpaid">¥{{ statistics.unpaidAmount || '0.00' }}</div>
            </div>
          </div>
        </div>
      </div>

      <el-tabs v-model="activeTab" type="border-card" class="fee-tabs">
        <!-- 我的账单 Tab -->
        <el-tab-pane label="我的账单" name="bill">
           <div class="bill-list" v-loading="billLoading">
             <el-empty v-if="billList.length === 0" description="暂无账单"></el-empty>
             <div v-else class="bill-card" v-for="bill in billList" :key="bill.queryId">
               <div class="bill-header">
                 <div class="bill-title">{{ getBillTitle(bill) }}</div>
                 <div class="bill-status">
                   <el-tag :type="getBillStatusTag(bill)">{{ getBillStatusText(bill) }}</el-tag>
                 </div>
               </div>
               <div class="bill-content">
                 <div class="bill-amount-row">
                    <div class="bill-amount-item">
                      <span class="label">总金额</span>
                      <span class="value">¥{{ bill.totalAmount }}</span>
                    </div>
                    <div class="bill-amount-item">
                      <span class="label">已付</span>
                      <span class="value paid">¥{{ bill.paidAmount }}</span>
                    </div>
                    <div class="bill-amount-item">
                      <span class="label">未付</span>
                      <span class="value unpaid">¥{{ bill.unpaidAmount }}</span>
                    </div>
                 </div>
                 <div class="bill-date">
                   账单周期：{{ bill.startDate }} 至 {{ bill.endDate }}
                 </div>
               </div>
               <div class="bill-footer">
                  <el-button type="text" @click="handleViewBillDetail(bill)">查看明细</el-button>
                  <el-button 
                    v-if="Number(bill.unpaidAmount) > 0" 
                    type="primary" 
                    size="small" 
                    @click="handlePayBill(bill)"
                  >立即支付</el-button>
                  <el-button v-else type="success" size="small" disabled>已付清</el-button>
               </div>
             </div>
           </div>
        </el-tab-pane>

        <!-- 费用明细 Tab -->
        <el-tab-pane label="费用明细" name="detail">
          <div class="fee-details">
            <div class="details-header">
              <h3>费用明细</h3>
              <div class="search-filters">
                <el-select v-model="queryParams.feeType" placeholder="费用类型" clearable @change="handleQuery">
                  <el-option label="全部" value="" />
                  <el-option label="床位费" value="room" />
                  <el-option label="餐饮费" value="meal" />
                  <el-option label="医疗费" value="medical" />
                  <el-option label="护理费" value="nursing" />
                  <el-option label="其他费用" value="other" />
                </el-select>
                <el-select v-model="queryParams.isPaid" placeholder="支付状态" clearable @change="handleQuery">
                  <el-option label="全部" value="" />
                  <el-option label="已付" value="1" />
                  <el-option label="未付" value="0" />
                </el-select>
              </div>
            </div>
            
            <div class="details-content">
              <el-table :data="feeList" v-loading="tableLoading" stripe>
                <el-table-column label="费用类型" width="100" align="center">
                  <template slot-scope="scope">
                    <el-tag :type="getFeeTypeTagType(scope.row.feeType)" size="mini">
                      {{ getFeeTypeName(scope.row.feeType) }}
                    </el-tag>
                  </template>
                </el-table-column>
                <el-table-column label="费用名称" prop="feeName" min-width="150" />
                <el-table-column label="费用金额" width="120" align="right">
                  <template slot-scope="scope">
                    <span class="amount">¥{{ scope.row.feeAmount }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="费用日期" width="120" align="center">
                  <template slot-scope="scope">
                    <span>{{ formatDate(scope.row.feeDate) }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="支付状态" width="100" align="center">
                  <template slot-scope="scope">
                    <el-tag :type="scope.row.isPaid === '1' ? 'success' : 'danger'" size="mini">
                      {{ scope.row.isPaid === '1' ? '已付' : '未付' }}
                    </el-tag>
                  </template>
                </el-table-column>
                <el-table-column label="支付日期" width="120" align="center">
                  <template slot-scope="scope">
                    <span>{{ scope.row.paidDate ? formatDate(scope.row.paidDate) : '-' }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="备注" prop="remark" min-width="150" show-overflow-tooltip />
                <el-table-column label="操作" width="120" align="center">
                  <template slot-scope="scope">
                    <el-button 
                      v-if="scope.row.isPaid === '0'" 
                      type="primary" 
                      size="mini" 
                      @click="handlePay(scope.row)"
                    >
                      支付
                    </el-button>
                    <el-tag v-else type="success" size="mini">已支付</el-tag>
                  </template>
                </el-table-column>
              </el-table>
              
              <!-- 分页 -->
              <div class="pagination-container">
                <el-pagination
                  @size-change="handleSizeChange"
                  @current-change="handleCurrentChange"
                  :current-page="queryParams.pageNum"
                  :page-sizes="[10, 20, 50, 100]"
                  :page-size="queryParams.pageSize"
                  layout="total, sizes, prev, pager, next, jumper"
                  :total="total"
                >
                </el-pagination>
              </div>
            </div>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>

    <!-- 支付对话框 -->
    <el-dialog title="费用支付" :visible.sync="payDialogVisible" width="500px">
      <div class="pay-dialog-content">
        <div class="fee-info">
          <h4>费用信息</h4>
          <div class="info-item">
            <span class="label">费用名称：</span>
            <span class="value">{{ currentFee.feeName }}</span>
          </div>
          <div class="info-item">
            <span class="label">费用类型：</span>
            <span class="value">{{ getFeeTypeName(currentFee.feeType) }}</span>
          </div>
          <div class="info-item">
            <span class="label">费用金额：</span>
            <span class="value amount">¥{{ currentFee.feeAmount }}</span>
          </div>
          <div class="info-item">
            <span class="label">费用日期：</span>
            <span class="value">{{ formatDate(currentFee.feeDate) }}</span>
          </div>
        </div>
        
        <div class="payment-method">
          <h4>选择支付方式</h4>
          <el-radio-group v-model="paymentMethod">
            <el-radio label="cash">现金支付</el-radio>
            <el-radio label="bank_transfer">银行转账</el-radio>
            <el-radio label="wechat">微信支付</el-radio>
            <el-radio label="alipay">支付宝</el-radio>
          </el-radio-group>
        </div>
        
        <div class="payment-note">
          <el-alert
            title="温馨提示"
            type="info"
            :closable="false"
            show-icon>
            <p>这是一个模拟支付功能，点击确认支付后，费用状态将更新为已支付。</p>
          </el-alert>
        </div>
      </div>
      
      <div slot="footer" class="dialog-footer">
        <el-button @click="payDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="confirmPay" :loading="payLoading">确认支付</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFamilyFee, getFamilyFeeStatistics, payFamilyFee, listFamilyBills, payFamilyBill } from '@/api/website/family-fee'
import { getElderlyListByFamilyId } from '@/api/website/family-user'
import { getFeeDetailList } from "@/api/website/fee-query";

export default {
  name: "FamilyFee",
  data() {
    return {
      // 当前激活的 Tab
      activeTab: 'bill',
      
      // 用户信息
      userInfo: {},
      elderlyInfo: null,
      
      // 加载状态
      loading: true,
      tableLoading: false,
      
      // 日期范围
      dateRange: [],
      
      // 统计数据
      statistics: {
        totalAmount: 0,
        paidAmount: 0,
        unpaidAmount: 0
      },
      
      // 费用列表
      feeList: [],
      total: 0,
      
      // 账单列表
      billList: [],
      billLoading: false,
      
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        familyId: null,
        elderlyId: null,
        feeType: '',
        isPaid: ''
      },
      
      // 支付相关
      payDialogVisible: false,
      payLoading: false,
      currentFee: {}, // 单笔支付对象
      currentBill: {}, // 账单支付对象
      paymentMethod: 'bank_transfer',
      payType: 'fee' // 'fee' or 'bill'
    }
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
  },
  watch: {
    activeTab(val) {
       if (val === 'bill') {
         this.loadBillList();
       } else {
         this.loadFeeList();
       }
    }
  },
  methods: {
    // 初始化用户信息
    initUserInfo() {
      const familyUser = JSON.parse(localStorage.getItem('family_user') || sessionStorage.getItem('family_user') || '{}');
      if (familyUser.familyId) {
        this.userInfo = familyUser;
      }
    },
    // 加载老人信息
    loadElderlyInfo() {
      if (!this.userInfo.familyId) {
        this.$message.error('用户信息不完整，请重新登录');
        this.$router.push('/website/family-login');
        return;
      }
      
      getElderlyListByFamilyId(this.userInfo.familyId).then(response => {
        if (response.code === 200 && response.data) {
          this.elderlyInfo = response.data;
          this.queryParams.familyId = this.userInfo.familyId;
          this.queryParams.elderlyId = this.elderlyInfo.elderlyId;
          this.loadStatistics();
          // 默认加载账单
          this.loadBillList();
        } else {
          this.$message.warning('暂未绑定老人信息，请联系管理员');
        }
        this.loading = false;
      }).catch(error => {
        this.$message.error('加载老人信息失败：' + (error.message || '未知错误'));
        this.loading = false;
      });
    },
    // 加载统计数据
    loadStatistics() {
      const params = {
        familyId: this.userInfo.familyId,
        elderlyId: this.elderlyInfo.elderlyId
      };
      
      if (this.dateRange && this.dateRange.length === 2) {
        params.startMonth = this.dateRange[0];
        params.endMonth = this.dateRange[1];
      }
      
      getFamilyFeeStatistics(params).then(response => {
        if (response.code === 200) {
          this.statistics = response.data.statistics || {};
        }
      }).catch(error => {
        console.error('加载统计数据失败:', error);
      });
    },
    // 加载账单列表
    loadBillList() {
      if (!this.elderlyInfo) return;
      this.billLoading = true;
      const params = {
        elderlyId: this.elderlyInfo.elderlyId,
        // 只查询已发送的账单，或者查询全部由前端过滤
        // queryStatus: '2' 
      };
      
      // 尝试调用接口
      listFamilyBills(params).then(response => {
         // 这里处理真实接口返回，或者模拟数据
         // 如果后端没实现，可能返回404，或者空数据
         if (response.code === 200 && response.rows) {
            // 过滤出已发送的账单 (queryStatus == '2')
            this.billList = response.rows.filter(item => item.queryStatus === '2');
         } else {
            this.billList = [];
         }
         this.billLoading = false;
      }).catch((error) => {
         console.error("加载账单列表失败", error);
         this.billList = [];
         this.billLoading = false;
      });
    },
    // 加载费用列表
    loadFeeList() {
      this.tableLoading = true;
      const params = { ...this.queryParams };
      
      if (this.dateRange && this.dateRange.length === 2) {
        params.startMonth = this.dateRange[0];
        params.endMonth = this.dateRange[1];
      }
      
      listFamilyFee(params).then(response => {
        if (response.code === 200) {
          this.feeList = response.rows || [];
          this.total = response.total || 0;
        }
        this.tableLoading = false;
      }).catch(error => {
        console.error('加载费用列表失败:', error);
        this.tableLoading = false;
      });
    },
    // 日期范围变化
    handleDateChange() {
      this.loadStatistics();
      if (this.activeTab === 'bill') {
         // 账单筛选逻辑暂未实现，可扩展
         this.loadBillList();
      } else {
         this.loadFeeList();
      }
    },
    // 查询
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.loadFeeList();
    },
    // 分页大小变化
    handleSizeChange(val) {
      this.queryParams.pageSize = val;
      this.loadFeeList();
    },
    // 当前页变化
    handleCurrentChange(val) {
      this.queryParams.pageNum = val;
      this.loadFeeList();
    },
    // 获取费用类型名称
    getFeeTypeName(feeType) {
      const typeMap = {
        'room': '床位费',
        'meal': '餐饮费',
        'medical': '医疗费',
        'nursing': '护理费',
        'other': '其他费用'
      };
      return typeMap[feeType] || '未知';
    },
    // 获取费用类型标签类型
    getFeeTypeTagType(feeType) {
      const typeMap = {
        'room': 'primary',
        'meal': 'success',
        'medical': 'warning',
        'nursing': 'info',
        'other': 'danger'
      };
      return typeMap[feeType] || 'info';
    },
    // 账单辅助方法
    getBillTitle(bill) {
       const typeMap = {
          'monthly': '月度账单',
          'quarterly': '季度账单',
          'yearly': '年度账单',
          'custom': '费用账单'
       };
       // 从日期中提取年月
       const date = new Date(bill.startDate);
       const year = date.getFullYear();
       const month = date.getMonth() + 1;
       return `${year}年${month}月 ${typeMap[bill.queryType] || '账单'}`;
    },
    getBillStatusTag(bill) {
       if (Number(bill.unpaidAmount) <= 0) return 'success';
       return 'danger';
    },
    getBillStatusText(bill) {
       if (Number(bill.unpaidAmount) <= 0) return '已付清';
       return '待支付';
    },
    // 查看账单明细
    handleViewBillDetail(bill) {
       // 跳转到明细Tab并筛选时间段，或者弹窗显示
       // 这里简单起见，切换到明细Tab并设置时间筛选
       // 更好的做法是弹窗显示该bill下的明细
       this.activeTab = 'detail';
       this.dateRange = [bill.startDate.substring(0, 7), bill.endDate.substring(0, 7)];
       // 触发查询
       this.$nextTick(() => {
          this.handleDateChange();
       });
    },
    // 支付账单
    handlePayBill(bill) {
       this.currentBill = { ...bill };
       this.currentFee = { 
          feeName: this.getBillTitle(bill),
          feeType: 'other', // 混合
          feeAmount: bill.unpaidAmount,
          feeDate: bill.endDate
       };
       this.payType = 'bill';
       this.paymentMethod = 'bank_transfer';
       this.payDialogVisible = true;
    },
    
    // 格式化日期
    formatDate(dateStr) {
      if (!dateStr) return '-';
      return dateStr;
    },
    // 返回首页
    goToDashboard() {
      this.$router.push('/family/dashboard');
    },
    // 处理单笔支付
    handlePay(row) {
      this.currentFee = { ...row };
      this.payType = 'fee';
      this.paymentMethod = 'bank_transfer';
      this.payDialogVisible = true;
    },
    // 确认支付
    confirmPay() {
      if (!this.paymentMethod) {
        this.$message.warning('请选择支付方式');
        return;
      }
      
      this.payLoading = true;
      
      if (this.payType === 'bill') {
         // 整单支付
         const payData = {
           queryId: this.currentBill.queryId,
           paymentMethod: this.paymentMethod,
           amount: this.currentBill.unpaidAmount
         };
         
         payFamilyBill(payData).then(response => {
            this.$message.success('账单支付成功！');
            this.payDialogVisible = false;
            this.loadStatistics();
            this.loadBillList();
            this.payLoading = false;
         }).catch(error => {
            this.$message.error('支付失败：' + (error.message || '未知错误'));
            this.payLoading = false;
         });
         
      } else {
         // 单笔支付
          const payData = {
            detailId: this.currentFee.detailId,
            paymentMethod: this.paymentMethod
          };
          
          payFamilyFee(payData).then(response => {
            if (response.code === 200) {
              this.$message.success('支付成功！');
              this.payDialogVisible = false;
              // 刷新数据
              this.loadStatistics();
              this.loadFeeList();
            } else {
              this.$message.error(response.msg || '支付失败，请重试');
            }
            this.payLoading = false;
          }).catch(error => {
            this.$message.error('支付失败：' + (error.message || '未知错误'));
            this.payLoading = false;
          });
      }
    }
  }
};
</script>

<style scoped>
.family-fee {
  min-height: 100vh;
  background: #f5f7fa;
}

/* 页面头部 */
.page-header {
  background: white;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.page-header h1 {
  margin: 0;
  color: #303133;
  font-size: 24px;
}

/* 加载状态 */
.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 400px;
}

.loading-content {
  text-align: center;
}

.loading-content i {
  font-size: 32px;
  color: #409EFF;
  margin-bottom: 10px;
}

.loading-content p {
  margin: 0;
  color: #666;
  font-size: 14px;
}

/* 费用容器 */
.fee-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

/* Tabs */
.fee-tabs {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  overflow: hidden;
  border: none;
}

/* 账单列表 */
.bill-list {
  padding: 10px;
}

.bill-card {
  border: 1px solid #ebeef5;
  border-radius: 8px;
  margin-bottom: 20px;
  background-color: #fff;
  transition: all 0.3s;
}

.bill-card:hover {
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.1);
}

.bill-header {
  padding: 15px 20px;
  border-bottom: 1px solid #ebeef5;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #f8f9fa;
  border-radius: 8px 8px 0 0;
}

.bill-title {
  font-size: 16px;
  font-weight: bold;
  color: #303133;
}

.bill-content {
  padding: 20px;
}

.bill-amount-row {
  display: flex;
  justify-content: space-around;
  margin-bottom: 20px;
}

.bill-amount-item {
  text-align: center;
}

.bill-amount-item .label {
  display: block;
  font-size: 13px;
  color: #909399;
  margin-bottom: 5px;
}

.bill-amount-item .value {
  font-size: 18px;
  font-weight: bold;
  color: #303133;
}

.bill-amount-item .value.paid {
  color: #67c23a;
}

.bill-amount-item .value.unpaid {
  color: #f56c6c;
}

.bill-date {
  text-align: center;
  color: #909399;
  font-size: 13px;
}

.bill-footer {
  padding: 10px 20px;
  border-top: 1px solid #ebeef5;
  text-align: right;
  background-color: #fcfcfc;
  border-radius: 0 0 8px 8px;
}

/* 老人信息 */
.elderly-info {
  margin-bottom: 20px;
}

.info-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  overflow: hidden;
}

.info-header {
  background: #409EFF;
  color: white;
  padding: 15px 20px;
}

.info-header h3 {
  margin: 0;
  font-size: 18px;
}

.info-content {
  padding: 20px;
  display: flex;
  gap: 40px;
}

.info-item {
  display: flex;
  align-items: center;
}

.info-item .label {
  font-weight: bold;
  color: #606266;
  margin-right: 8px;
}

.info-item .value {
  color: #303133;
}

/* 费用统计 */
.fee-statistics {
  margin-bottom: 20px;
}

.statistics-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  overflow: hidden;
}

.statistics-header {
  background: #67c23a;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.statistics-header h3 {
  margin: 0;
  font-size: 18px;
}

.date-range {
  background: rgba(255,255,255,0.2);
  border-radius: 4px;
  padding: 5px;
}

.statistics-content {
  padding: 20px;
  display: flex;
  gap: 40px;
}

.stat-item {
  text-align: center;
}

.stat-label {
  font-size: 14px;
  color: #909399;
  margin-bottom: 8px;
}

.stat-value {
  font-size: 24px;
  font-weight: bold;
}

.stat-value.total {
  color: #409EFF;
}

.stat-value.paid {
  color: #67c23a;
}

.stat-value.unpaid {
  color: #f56c6c;
}


/* 费用明细 */
.fee-details {
  /* background: white; */
  /* border-radius: 8px; */
  /* box-shadow: 0 2px 8px rgba(0,0,0,0.1); */
  overflow: hidden;
}

.details-header {
  background: #909399;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-radius: 4px 4px 0 0;
}

.details-header h3 {
  margin: 0;
  font-size: 18px;
}

.search-filters {
  display: flex;
  gap: 10px;
}

.details-content {
  padding: 20px 0;
}

.amount {
  font-weight: bold;
  color: #e6a23c;
}

.pagination-container {
  margin-top: 20px;
  text-align: right;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .fee-container {
    padding: 10px;
  }
  
  .info-content {
    flex-direction: column;
    gap: 15px;
  }
  
  .statistics-content {
    flex-direction: column;
    gap: 20px;
  }
  
  .details-header {
    flex-direction: column;
    gap: 15px;
    align-items: flex-start;
  }
  
  .search-filters {
    flex-direction: column;
    width: 100%;
  }
}

/* 支付对话框样式 */
.pay-dialog-content {
  padding: 20px 0;
}

.fee-info {
  margin-bottom: 30px;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 6px;
}

.fee-info h4 {
  margin: 0 0 15px 0;
  color: #303133;
  font-size: 16px;
}

.fee-info .info-item {
  display: flex;
  margin-bottom: 10px;
}

.fee-info .info-item .label {
  width: 80px;
  color: #606266;
  font-weight: bold;
}

.fee-info .info-item .value {
  color: #303133;
}

.fee-info .info-item .value.amount {
  color: #e6a23c;
  font-weight: bold;
  font-size: 16px;
}

.payment-method {
  margin-bottom: 30px;
}

.payment-method h4 {
  margin: 0 0 15px 0;
  color: #303133;
  font-size: 16px;
}

.payment-method .el-radio-group {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.payment-method .el-radio {
  margin-right: 0;
}

.payment-note {
  margin-bottom: 20px;
}

.payment-note .el-alert p {
  margin: 0;
  font-size: 14px;
}
</style>
