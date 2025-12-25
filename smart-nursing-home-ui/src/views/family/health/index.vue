<template>
  <div class="family-health">
    <!-- 页面标题 -->
    <div class="page-header">
      <h1>健康报告</h1>
      <el-button type="primary" @click="goToDashboard">返回首页</el-button>
    </div>

    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <div class="loading-content">
        <i class="el-icon-loading"></i>
        <p>加载中...</p>
      </div>
    </div>

    <!-- 健康报告列表 -->
    <div class="health-reports" v-if="!loading">
      <!-- 筛选条件 -->
      <div class="filter-section">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="80px">
          <el-form-item label="报告类型" prop="reportType">
            <el-select v-model="queryParams.reportType" placeholder="请选择报告类型" clearable>
              <el-option label="全部" value="" />
              <el-option label="体检" value="体检" />
              <el-option label="医疗" value="医疗" />
              <el-option label="护理" value="护理" />
            </el-select>
          </el-form-item>
          <el-form-item label="报告日期" prop="reportDate">
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
      </div>

      <!-- 报告列表 -->
      <div class="reports-list">
        <div class="report-item" v-for="report in healthReportList" :key="report.reportId" @click="viewReport(report)">
          <div class="report-header">
            <div class="report-type">
              <el-tag :type="getReportTypeTag(report.reportType)">{{ report.reportType }}</el-tag>
            </div>
            <div class="report-date">{{ formatDate(report.reportDate) }}</div>
          </div>
          <div class="report-content">
            <h3>{{ report.elderlyName }} - {{ report.reportType }}报告</h3>
            <div class="report-summary">
              <div class="summary-item" v-if="report.doctorName">
                <i class="el-icon-user"></i>
                <span>医生：{{ report.doctorName }}</span>
              </div>
              <div class="summary-item" v-if="report.nurseName">
                <i class="el-icon-user-solid"></i>
                <span>护士：{{ report.nurseName }}</span>
              </div>
            </div>
            <div class="vital-signs" v-if="report.bloodPressure || report.heartRate || report.temperature">
              <div class="vital-item" v-if="report.bloodPressure">
                <span class="label">血压：</span>
                <span class="value">{{ report.bloodPressure }}</span>
              </div>
              <div class="vital-item" v-if="report.heartRate">
                <span class="label">心率：</span>
                <span class="value">{{ report.heartRate }}次/分</span>
              </div>
              <div class="vital-item" v-if="report.temperature">
                <span class="label">体温：</span>
                <span class="value">{{ report.temperature }}°C</span>
              </div>
            </div>
          </div>
          <div class="report-footer">
            <el-button type="text" size="small">查看详情</el-button>
          </div>
        </div>
      </div>

      <!-- 分页 -->
      <div class="pagination-container">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryParams.pageNum"
          :page-sizes="[10, 20, 50, 100]"
          :page-size="queryParams.pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>

    <!-- 无数据状态 -->
    <div class="no-data" v-if="!loading && healthReportList.length === 0">
      <i class="el-icon-document"></i>
      <p>暂无健康报告</p>
    </div>

    <!-- 报告详情对话框 -->
    <el-dialog
      title="健康报告详情"
      :visible.sync="reportDialogVisible"
      width="80%"
      :before-close="handleCloseDialog">
      <div class="report-detail" v-if="currentReport">
        <div class="detail-header">
          <h2>{{ currentReport.elderlyName }} - {{ currentReport.reportType }}报告</h2>
          <div class="detail-meta">
            <span>报告日期：{{ formatDate(currentReport.reportDate) }}</span>
            <span v-if="currentReport.doctorName">医生：{{ currentReport.doctorName }}</span>
            <span v-if="currentReport.nurseName">护士：{{ currentReport.nurseName }}</span>
          </div>
        </div>

        <div class="detail-content">
          <!-- 生命体征 -->
          <div class="detail-section" v-if="hasVitalSigns">
            <h3>生命体征</h3>
            <div class="vital-signs-grid">
              <div class="vital-card" v-if="currentReport.bloodPressure">
                <div class="vital-label">血压</div>
                <div class="vital-value">{{ currentReport.bloodPressure }}</div>
              </div>
              <div class="vital-card" v-if="currentReport.heartRate">
                <div class="vital-label">心率</div>
                <div class="vital-value">{{ currentReport.heartRate }}次/分</div>
              </div>
              <div class="vital-card" v-if="currentReport.temperature">
                <div class="vital-label">体温</div>
                <div class="vital-value">{{ currentReport.temperature }}°C</div>
              </div>
              <div class="vital-card" v-if="currentReport.weight">
                <div class="vital-label">体重</div>
                <div class="vital-value">{{ currentReport.weight }}kg</div>
              </div>
              <div class="vital-card" v-if="currentReport.height">
                <div class="vital-label">身高</div>
                <div class="vital-value">{{ currentReport.height }}cm</div>
              </div>
              <div class="vital-card" v-if="currentReport.bloodSugar">
                <div class="vital-label">血糖</div>
                <div class="vital-value">{{ currentReport.bloodSugar }}mmol/L</div>
              </div>
              <div class="vital-card" v-if="currentReport.bloodOxygen">
                <div class="vital-label">血氧饱和度</div>
                <div class="vital-value">{{ currentReport.bloodOxygen }}%</div>
              </div>
            </div>
          </div>

          <!-- 症状描述 -->
          <div class="detail-section" v-if="currentReport.symptoms">
            <h3>症状描述</h3>
            <p>{{ currentReport.symptoms }}</p>
          </div>

          <!-- 诊断结果 -->
          <div class="detail-section" v-if="currentReport.diagnosis">
            <h3>诊断结果</h3>
            <p>{{ currentReport.diagnosis }}</p>
          </div>

          <!-- 治疗方案 -->
          <div class="detail-section" v-if="currentReport.treatment">
            <h3>治疗方案</h3>
            <p>{{ currentReport.treatment }}</p>
          </div>

          <!-- 用药情况 -->
          <div class="detail-section" v-if="currentReport.medications">
            <h3>用药情况</h3>
            <p>{{ currentReport.medications }}</p>
          </div>

          <!-- 护理记录 -->
          <div class="detail-section" v-if="currentReport.nursingNotes">
            <h3>护理记录</h3>
            <p>{{ currentReport.nursingNotes }}</p>
          </div>

          <!-- 建议 -->
          <div class="detail-section" v-if="currentReport.recommendations">
            <h3>建议</h3>
            <p>{{ currentReport.recommendations }}</p>
          </div>

          <!-- 下次检查日期 -->
          <div class="detail-section" v-if="currentReport.nextCheckDate">
            <h3>下次检查日期</h3>
            <p>{{ formatDate(currentReport.nextCheckDate) }}</p>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFamilyHealthReport, getFamilyHealthReport } from "@/api/website/family-health";
import { getElderlyListByFamilyId } from "@/api/website/family-user";

export default {
  name: "FamilyHealth",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 健康报告列表
      healthReportList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyId: null,
        elderlyName: null,
        reportType: null,
        doctorName: null,
        nurseName: null,
        reportDate: null,
        status: '0'  // 只查询正常状态的报告
      },
      // 当前查看的报告
      currentReport: null,
      // 报告详情对话框显示状态
      reportDialogVisible: false,
      // 老人信息
      elderlyInfo: null
    }
  },
  computed: {
    // 是否有生命体征数据
    hasVitalSigns() {
      if (!this.currentReport) return false;
      return this.currentReport.bloodPressure || 
             this.currentReport.heartRate || 
             this.currentReport.temperature ||
             this.currentReport.weight ||
             this.currentReport.height ||
             this.currentReport.bloodSugar ||
             this.currentReport.bloodOxygen;
    }
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
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
          // 获取老人信息
          this.elderlyInfo = response.data;
          // 设置查询条件中的老人ID
          this.queryParams.elderlyId = this.elderlyInfo.elderlyId;
          // 加载健康报告列表
          this.getList();
        } else {
          this.$message.warning('暂未绑定老人信息，请联系管理员');
        }
      }).catch(error => {
        this.$message.error('加载老人信息失败：' + (error.message || '未知错误'));
      });
    },
    /** 查询健康报告列表 */
    getList() {
      this.loading = true;
      listFamilyHealthReport(this.queryParams).then(response => {
        this.healthReportList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    /** 查看报告详情 */
    viewReport(report) {
      this.currentReport = report;
      this.reportDialogVisible = true;
    },
    /** 关闭对话框 */
    handleCloseDialog() {
      this.reportDialogVisible = false;
      this.currentReport = null;
    },
    /** 返回首页 */
    goToDashboard() {
      this.$router.push('/family/dashboard');
    },
    /** 格式化日期 */
    formatDate(date) {
      if (!date) return '';
      const d = new Date(date);
      const year = d.getFullYear();
      const month = String(d.getMonth() + 1).padStart(2, '0');
      const day = String(d.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    },
    /** 获取报告类型标签样式 */
    getReportTypeTag(type) {
      const typeMap = {
        '体检': 'success',
        '医疗': 'warning',
        '护理': 'info'
      };
      return typeMap[type] || 'primary';
    },
    /** 重置表单 */
    resetForm(refName) {
      if (this.$refs[refName]) {
        this.$refs[refName].resetFields();
      }
    },
    /** 分页相关 */
    handleSizeChange(val) {
      this.queryParams.pageSize = val;
      this.getList();
    },
    handleCurrentChange(val) {
      this.queryParams.pageNum = val;
      this.getList();
    }
  }
}
</script>

<style scoped>
.family-health {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.page-header h1 {
  margin: 0;
  color: #333;
  font-size: 24px;
}

.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 200px;
}

.loading-content {
  text-align: center;
  color: #666;
}

.loading-content i {
  font-size: 24px;
  margin-bottom: 10px;
  animation: rotating 2s linear infinite;
}

.loading-content p {
  margin: 0;
  font-size: 14px;
}

@keyframes rotating {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.health-reports {
  max-width: 1200px;
  margin: 0 auto;
}

.filter-section {
  background: white;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  margin-bottom: 20px;
}

.reports-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
  gap: 20px;
  margin-bottom: 20px;
}

.report-item {
  background: white;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  cursor: pointer;
  transition: all 0.3s ease;
}

.report-item:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  transform: translateY(-2px);
}

.report-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.report-date {
  color: #666;
  font-size: 14px;
}

.report-content h3 {
  margin: 0 0 10px 0;
  color: #333;
  font-size: 18px;
}

.report-summary {
  display: flex;
  gap: 20px;
  margin-bottom: 15px;
}

.summary-item {
  display: flex;
  align-items: center;
  gap: 5px;
  color: #666;
  font-size: 14px;
}

.summary-item i {
  color: #409EFF;
}

.vital-signs {
  display: flex;
  gap: 15px;
  flex-wrap: wrap;
}

.vital-item {
  display: flex;
  align-items: center;
  gap: 5px;
  font-size: 14px;
}

.vital-item .label {
  color: #666;
}

.vital-item .value {
  color: #333;
  font-weight: 500;
}

.report-footer {
  text-align: right;
  margin-top: 15px;
  padding-top: 15px;
  border-top: 1px solid #f0f0f0;
}

.pagination-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.no-data {
  text-align: center;
  padding: 60px 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.no-data i {
  font-size: 64px;
  color: #ccc;
  margin-bottom: 20px;
}

.no-data p {
  color: #666;
  font-size: 16px;
}

/* 报告详情对话框样式 */
.report-detail {
  max-height: 70vh;
  overflow-y: auto;
}

.detail-header {
  margin-bottom: 30px;
  padding-bottom: 20px;
  border-bottom: 2px solid #f0f0f0;
}

.detail-header h2 {
  margin: 0 0 10px 0;
  color: #333;
  font-size: 24px;
}

.detail-meta {
  display: flex;
  gap: 20px;
  color: #666;
  font-size: 14px;
}

.detail-content {
  line-height: 1.6;
}

.detail-section {
  margin-bottom: 30px;
}

.detail-section h3 {
  margin: 0 0 15px 0;
  color: #333;
  font-size: 18px;
  border-left: 4px solid #409EFF;
  padding-left: 10px;
}

.detail-section p {
  margin: 0;
  color: #666;
  line-height: 1.8;
}

.vital-signs-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 15px;
}

.vital-card {
  background: #f8f9fa;
  padding: 15px;
  border-radius: 8px;
  text-align: center;
}

.vital-label {
  color: #666;
  font-size: 14px;
  margin-bottom: 5px;
}

.vital-value {
  color: #333;
  font-size: 18px;
  font-weight: 600;
}

@media (max-width: 768px) {
  .family-health {
    padding: 15px;
  }
  
  .page-header {
    flex-direction: column;
    gap: 15px;
    text-align: center;
  }
  
  .reports-list {
    grid-template-columns: 1fr;
  }
  
  .report-summary {
    flex-direction: column;
    gap: 10px;
  }
  
  .vital-signs {
    flex-direction: column;
    gap: 10px;
  }
  
  .detail-meta {
    flex-direction: column;
    gap: 10px;
  }
  
  .vital-signs-grid {
    grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  }
}
</style>
