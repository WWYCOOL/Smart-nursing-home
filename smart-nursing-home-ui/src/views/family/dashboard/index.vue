<template>
  <div class="family-dashboard">
    <!-- 顶部导航栏 -->
    <header class="header">
      <div class="container">
        <div class="logo">
          <h1>智慧养老院</h1>
          <p>家属服务中心，一站式查看老人的健康信息，缴费信息，最新动态等</p>
        </div>
        <div class="header-actions">
          <span class="welcome-text"
            >欢迎，{{ userInfo.familyName || userInfo.username }}</span
          >
          <el-button type="primary" @click="logout">退出登录</el-button>
        </div>
      </div>
    </header>

    <!-- 主要内容区域 -->
    <div class="main-content">
      <!-- 加载状态 -->
      <div v-if="loading" class="loading-container">
        <div class="loading-content">
          <i class="el-icon-loading"></i>
          <p>加载中...</p>
        </div>
      </div>

      <!-- 老人信息卡片 -->
      <div class="elderly-card" v-if="elderlyInfo && !loading">
        <div class="elderly-header">
          <div class="elderly-info">
            <h2>{{ elderlyInfo.elderlyName }}</h2>
            <div class="elderly-details">
              <div class="detail-item">
                <span class="label">房间号：</span>
                <span class="value">{{
                  elderlyInfo.roomNumber || "未分配"
                }}</span>
              </div>
              <div class="detail-item">
                <span class="label">护理等级：</span>
                <span class="value care-level">{{
                  elderlyInfo.careLevel || "未知"
                }}</span>
              </div>
              <div class="detail-item">
                <span class="label">入住时间：</span>
                <span class="value">{{
                  elderlyInfo.admissionDate || "未知"
                }}</span>
              </div>
            </div>
          </div>
          <div class="elderly-status">
            <div class="status-badge" :class="overallHealthStatus.class">
              <i :class="overallHealthStatus.icon"></i>
              <span>{{ overallHealthStatus.status }}</span>
            </div>
            <div class="last-update">最后更新：{{ getCurrentTime() }}</div>
          </div>
        </div>
        <div class="elderly-summary">
          <div class="summary-item">
            <div class="summary-label">今日护理</div>
            <div class="summary-value">已完成</div>
          </div>
          <div class="summary-item">
            <div class="summary-label">用药情况</div>
            <div class="summary-value">按时服药</div>
          </div>
          <div class="summary-item">
            <div class="summary-label">活动参与</div>
            <div class="summary-value">积极参与</div>
          </div>
        </div>
      </div>

      <!-- 功能菜单 -->
      <div class="function-menu">
        <div class="menu-grid">
          <div class="menu-item" @click="openCareProjects">
            <div class="menu-icon">
              <i class="el-icon-s-operation"></i>
            </div>
            <div class="menu-content">
              <h3>护理项目</h3>
              <p>购买服务、查看任务状态</p>
            </div>
          </div>
          <div class="menu-item" @click="goToElderly">
            <div class="menu-icon">
              <i class="el-icon-user"></i>
            </div>
            <div class="menu-content">
              <h3>老人信息</h3>
              <p>查看基本信息、健康状况</p>
            </div>
          </div>

          <div class="menu-item" @click="goToHealth">
            <div class="menu-icon">
              <i class="el-icon-document"></i>
            </div>
            <div class="menu-content">
              <h3>健康报告</h3>
              <p>查看健康检查报告</p>
            </div>
          </div>

          <div class="menu-item" @click="goToCommunication">
            <div class="menu-icon">
              <i class="el-icon-chat-dot-round"></i>
            </div>
            <div class="menu-content">
              <h3>在线沟通</h3>
              <p>与护理人员沟通</p>
            </div>
          </div>

          <div class="menu-item" @click="goToFee">
            <div class="menu-icon">
              <i class="el-icon-money"></i>
            </div>
            <div class="menu-content">
              <h3>费用查询</h3>
              <p>查看费用明细</p>
            </div>
          </div>

          <div class="menu-item" @click="openFeedback">
            <div class="menu-icon">
              <i class="el-icon-edit-outline"></i>
            </div>
            <div class="menu-content">
              <h3>意见反馈</h3>
              <p>提交您的宝贵意见</p>
            </div>
          </div>
        </div>
      </div>

      <!-- 意见反馈对话框 -->
      <el-dialog
        :title="feedbackTitle"
        :visible.sync="feedbackOpen"
        width="500px"
        append-to-body
      >
        <el-form
          ref="feedbackForm"
          :model="feedbackForm"
          :rules="feedbackRules"
          label-width="80px"
        >
          <el-form-item label="反馈类型" prop="feedbackType">
            <el-select
              v-model="feedbackForm.feedbackType"
              placeholder="请选择反馈类型"
              style="width: 100%"
            >
              <el-option
                v-for="dict in dict.type.feedback_type"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="反馈标题" prop="title">
            <el-input
              v-model="feedbackForm.title"
              placeholder="请输入反馈标题"
            />
          </el-form-item>
          <el-form-item label="反馈内容" prop="content">
            <el-input
              v-model="feedbackForm.content"
              type="textarea"
              :rows="4"
              placeholder="请输入反馈内容"
            />
          </el-form-item>
          <el-form-item label="联系人" prop="contactName">
            <el-input
              v-model="feedbackForm.contactName"
              placeholder="请输入联系人姓名"
            />
          </el-form-item>
          <el-form-item label="联系电话" prop="contactPhone">
            <el-input
              v-model="feedbackForm.contactPhone"
              placeholder="请输入联系电话"
            />
          </el-form-item>
          <el-form-item label="联系邮箱" prop="contactPhone">
            <el-input
              v-model="feedbackForm.contactEmail"
              placeholder="请输入联系邮箱"
            />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitFeedback">确 定</el-button>
          <el-button @click="cancelFeedback">取 消</el-button>
        </div>
      </el-dialog>

      <!-- 信息展示区域 -->
      <div class="info-section">
        <!-- 官方通知 -->
        <div class="info-card notice-card">
          <div class="card-header">
            <h3>
              <i class="el-icon-bell"></i>
              官方通知
            </h3>
            <el-button
              type="text"
              size="small"
              @click="loadNotices"
              :loading="noticesLoading"
            >
              {{ noticesLoading ? "加载中..." : "刷新" }}
            </el-button>
          </div>
          <div class="card-content">
            <div class="notice-list">
              <div
                class="notice-item"
                v-for="notice in notices"
                :key="notice.noticeId"
              >
                <div class="notice-header">
                  <div class="notice-title">{{ notice.noticeTitle }}</div>
                  <div
                    class="notice-type"
                    :class="getNoticeTypeClass(notice.noticeType)"
                  >
                    {{ getNoticeTypeText(notice.noticeType) }}
                  </div>
                </div>
                <div class="notice-content" v-html="notice.noticeContent"></div>
                <div class="notice-footer">
                  <span class="notice-time">{{
                    formatDate(notice.createTime)
                  }}</span>
                  <el-button
                    type="text"
                    size="mini"
                    @click="showNoticeDetail(notice)"
                  >
                    查看详情
                  </el-button>
                </div>
              </div>
              <div
                v-if="notices.length === 0 && !noticesLoading"
                class="no-notice"
              >
                <p>暂无官方通知</p>
              </div>
            </div>
          </div>
        </div>

        <!-- 最新动态 -->
        <div class="info-card">
          <div class="card-header">
            <h3>最新动态</h3>
            <el-button
              type="text"
              size="small"
              @click="toggleActivities"
              v-if="recentActivities.length > 4"
            >
              {{ showAllActivities ? "收起" : "展开" }}
            </el-button>
          </div>
          <div class="card-content">
            <div class="activity-list">
              <div
                class="activity-item"
                v-for="item in displayedActivities"
                :key="item.id"
              >
                <div class="activity-time">{{ item.time }}</div>
                <div class="activity-content">{{ item.content }}</div>
              </div>
              <div v-if="recentActivities.length === 0" class="no-activity">
                <p>暂无最新动态</p>
              </div>
            </div>
        </div>
      </div>

      <!-- 健康状态 -->
      <div class="info-card" v-if="elderlyInfo">
          <div class="card-header">
            <h3>健康状态</h3>
            <el-button type="text" size="small" @click="goToHealth"
              >查看详情</el-button
            >
          </div>
          <div class="card-content">
            <div class="health-grid">
              <div
                class="health-item"
                :class="getBloodPressureClass(latestHealthReport.bloodPressure)"
              >
                <div class="health-label">血压</div>
                <div class="health-value">
                  {{ getBloodPressureStatus(latestHealthReport.bloodPressure) }}
                </div>
                <div
                  class="health-detail"
                  v-if="latestHealthReport.bloodPressure"
                >
                  {{ latestHealthReport.bloodPressure }}
                </div>
              </div>
              <div
                class="health-item"
                :class="getHeartRateClass(latestHealthReport.heartRate)"
              >
                <div class="health-label">心率</div>
                <div class="health-value">
                  {{ getHeartRateStatus(latestHealthReport.heartRate) }}
                </div>
                <div class="health-detail" v-if="latestHealthReport.heartRate">
                  {{ latestHealthReport.heartRate }} 次/分
                </div>
              </div>
              <div
                class="health-item"
                :class="getTemperatureClass(latestHealthReport.temperature)"
              >
                <div class="health-label">体温</div>
                <div class="health-value">
                  {{ getTemperatureStatus(latestHealthReport.temperature) }}
                </div>
                <div
                  class="health-detail"
                  v-if="latestHealthReport.temperature"
                >
                  {{ latestHealthReport.temperature }}°C
                </div>
              </div>
            </div>
            <div class="health-footer" v-if="latestHealthReport.reportDate">
              <span class="report-date"
                >数据来源于最近一次报告时间：{{
                  formatDate(latestHealthReport.reportDate)
                }}</span
              >
            </div>
          </div>
        </div>
      </div>
      
    </div>

      <el-dialog :title="careTitle" :visible.sync="careOpen" width="860px" append-to-body>
        <div class="card-content">
          <div class="card-header" style="padding: 10px 0; border-bottom: none;">
            <h3>购买服务</h3>
          </div>
          <el-form ref="buyForm" :model="buyForm" :rules="buyRules" label-width="100px">
            <el-form-item label="生活照料项目" prop="projectId">
              <el-select v-model="buyForm.projectId" placeholder="请选择项目" filterable @change="handleProjectChange" style="width: 100%">
                <el-option v-for="p in livingCareProjects" :key="p.projectId" :label="p.projectName" :value="p.projectId">
                  <span style="float:left">{{ p.projectName }}</span>
                  <span style="float:right;color:#8492a6;font-size:13px">￥{{ p.price }}</span>
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="项目单价">
              <el-input v-model="buyForm.projectPrice" placeholder="自动填充" disabled />
            </el-form-item>
            <el-form-item label="执行日期" prop="executeDate">
              <el-date-picker v-model="buyForm.executeDate" type="date" placeholder="选择日期" value-format="yyyy-MM-dd" style="width: 100%" />
            </el-form-item>
            <el-form-item label="执行时间" prop="executeTime">
              <el-time-picker v-model="buyForm.executeTime" placeholder="选择时间" value-format="HH:mm" style="width: 100%" />
            </el-form-item>
            <el-form-item label="次数" prop="times">
              <el-input-number v-model="buyForm.times" :min="1" :max="30" controls-position="right" />
            </el-form-item>
            <el-form-item label="执行护士" prop="nurseId">
              <el-select v-model="buyForm.nurseId" placeholder="请选择护士" filterable @change="handleNurseChange" style="width: 100%">
                <el-option v-for="n in nurseOptions" :key="n.userId" :label="n.nickName" :value="n.userId" />
              </el-select>
            </el-form-item>
            <el-form-item label="备注">
              <el-input v-model="buyForm.remark" type="textarea" :rows="3" placeholder="可填写特殊需求或说明" />
            </el-form-item>
          </el-form>
          <div style="text-align:right;margin-top: -10px;">
            <el-button type="primary" :loading="buySubmitting" @click="submitBuy">确 定</el-button>
          </div>

          <div class="card-header" style="padding: 20px 0 10px;">
            <h3>护理任务状态</h3>
            <el-button type="text" size="small" @click="loadTasks">刷新</el-button>
          </div>
          <el-table :data="taskList" size="small" style="width: 100%">
            <el-table-column label="项目" prop="projectName" align="center" />
            <el-table-column label="计划执行时间" prop="planTime" align="center" width="180">
              <template slot-scope="scope">
                <span>{{ formatDateTime(scope.row.planTime) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="实际执行时间" prop="executeTime" align="center" width="180">
              <template slot-scope="scope">
                <span>{{ formatDateTime(scope.row.executeTime) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="执行护士" prop="nurseName" align="center" width="140" />
            <el-table-column label="执行备注" prop="taskRemark" align="center" />
            <el-table-column label="执行照片" prop="imageUrl" align="center" width="120">
              <template slot-scope="scope">
                <el-image v-if="scope.row.imageUrl" :src="scope.row.imageUrl" :preview-src-list="[scope.row.imageUrl]" style="width:50px;height:50px;border-radius:4px;" fit="cover" />
                <span v-else style="color:#999;">无</span>
              </template>
            </el-table-column>
            <el-table-column label="状态" prop="status" align="center" width="120">
              <template slot-scope="scope">
                <span>{{ getTaskStatusText(scope.row.status) }}</span>
              </template>
            </el-table-column>
          </el-table>
          <div v-if="taskList.length === 0" class="no-activity" style="padding:10px 0;">
            <p>暂无护理任务</p>
          </div>
        </div>
        <div slot="footer" class="dialog-footer">
          <el-button @click="careOpen=false">关 闭</el-button>
        </div>
      </el-dialog>

    <!-- 页脚 -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section">
            <h4>智慧养老院</h4>
            <p>让爱陪伴每一天</p>
          </div>
          <div class="footer-section">
            <h4>联系方式</h4>
            <p>电话：400-123-4567</p>
            <p>地址：北京市朝阳区智慧养老院路123号</p>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; 2024 智慧养老院. 保留所有权利.</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import { getElderlyListByFamilyId } from "@/api/website/family-user";
import { getFamilyRecentActivities } from "@/api/website/family-activity";
import { getLatestHealthReport } from "@/api/website/family-health-latest";
import {
  evaluateBloodPressure,
  evaluateHeartRate,
  evaluateTemperature,
} from "@/utils/health-standards";
import { listWebsiteNotice } from "@/api/website/notice";
import { addFeedback } from "@/api/website/feedback";
import { listNursingProject } from "@/api/website/nursingProject";
import { addNursingTask, listNursingTask } from "@/api/website/nursingTask";
import { listRole, allocatedUserList } from "@/api/system/role";
import request from "@/utils/request";

export default {
  name: "FamilyDashboard",
  dicts: ["feedback_type"],
  data() {
    return {
      userInfo: {
        familyId: null,
        familyName: "",
        username: "",
      },
      elderlyInfo: null,
      elderlyList: [],
      recentActivities: [],
      latestHealthReport: {},
      loading: false,
      // 是否显示所有动态
      showAllActivities: false,
      // 通知相关数据
      notices: [],
      noticesLoading: false,
      // 意见反馈相关
      feedbackOpen: false,
      feedbackTitle: "提交意见反馈",
      feedbackForm: {},
      feedbackRules: {
        feedbackType: [
          { required: true, message: "反馈类型不能为空", trigger: "change" },
        ],
        title: [
          { required: true, message: "反馈标题不能为空", trigger: "blur" },
        ],
        content: [
          { required: true, message: "反馈内容不能为空", trigger: "blur" },
        ],
        contactName: [
          { required: true, message: "联系人姓名不能为空", trigger: "blur" },
        ],
        contactPhone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" },
        ],
      },
      careOpen: false,
      careTitle: "护理项目",
      buySubmitting: false,
      buyForm: {
        projectId: undefined,
        projectName: undefined,
        projectPrice: undefined,
        executeDate: undefined,
        executeTime: undefined,
        times: 1,
        nurseId: undefined,
        nurseName: undefined,
        remark: undefined,
      },
      buyRules: {
        projectId: [{ required: true, message: "请选择项目", trigger: "change" }],
        executeDate: [{ required: true, message: "请选择日期", trigger: "change" }],
        executeTime: [{ required: true, message: "请选择时间", trigger: "change" }],
        times: [{ required: true, message: "请填写次数", trigger: "blur" }],
        nurseId: [{ required: true, message: "请选择护士", trigger: "change" }],
      },
      livingCareProjects: [],
      nurseOptions: [],
      taskList: [],
    };
  },
  computed: {
    // 根据展开状态显示不同的动态数据
    displayedActivities() {
      if (this.showAllActivities) {
        return this.recentActivities;
      } else {
        return this.recentActivities.slice(0, 4);
      }
    },

    // 计算健康状态总评估
    overallHealthStatus() {
      if (!this.latestHealthReport || !this.latestHealthReport.bloodPressure) {
        return {
          status: "未知",
          class: "status-unknown",
          icon: "el-icon-question",
        };
      }

      const bloodPressureResult = evaluateBloodPressure(
        this.latestHealthReport.bloodPressure
      );
      const heartRateResult = evaluateHeartRate(
        this.latestHealthReport.heartRate
      );
      const temperatureResult = evaluateTemperature(
        this.latestHealthReport.temperature
      );

      // 优先级：发热 > 偏高 > 正常 > 偏低
      const statuses = [
        bloodPressureResult,
        heartRateResult,
        temperatureResult,
      ];

      // 检查是否有发热状态
      if (
        statuses.some(
          (result) =>
            result.class === "health-high" && result.status.includes("发热")
        )
      ) {
        return {
          status: "发热",
          class: "status-high",
          icon: "el-icon-warning",
        };
      }

      // 检查是否有偏高状态
      if (statuses.some((result) => result.class === "health-high")) {
        return {
          status: "偏高",
          class: "status-warning",
          icon: "el-icon-warning",
        };
      }

      // 检查是否有正常偏高状态
      if (statuses.some((result) => result.class === "health-warning")) {
        return {
          status: "正常偏高",
          class: "status-warning",
          icon: "el-icon-info",
        };
      }

      // 检查是否有偏低状态
      if (statuses.some((result) => result.class === "health-low")) {
        return { status: "偏低", class: "status-low", icon: "el-icon-minus" };
      }

      // 如果都是正常状态
      if (statuses.every((result) => result.class === "health-normal")) {
        return {
          status: "正常",
          class: "status-normal",
          icon: "el-icon-check",
        };
      }

      return { status: "正常", class: "status-normal", icon: "el-icon-check" };
    },
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
    this.loadRecentActivities();
    this.loadLatestHealthReport();
    this.loadNoticegCareProjects();
  
    // 监听健康标准配置更新事件
    window.addEventListener(
      "healthStandardsUpdated",
      this.handleHealthStandardsUpdate
    );
  },

  beforeDestroy() {
    // 移除事件监听器
    window.removeEventListener(
      "healthStandardsUpdated",
      this.handleHealthStandardsUpdate
    );
  },
  methods: {
    // 处理健康标准配置更新
    handleHealthStandardsUpdate(event) {
      this.$message.success("健康标准配置已更新，正在重新评估...");

      // 重新加载健康报告以触发重新评估
      if (this.userInfo.familyId) {
        this.loadLatestHealthReport();
      }
    },

    // 初始化用户信息
    initUserInfo() {
      const familyUser = JSON.parse(
        localStorage.getItem("family_user") ||
          sessionStorage.getItem("family_user") ||
          "{}"
      );
      if (familyUser.familyId) {
        this.userInfo = familyUser;
      }
    },
    // 加载老人信息
    loadElderlyInfo() {
      if (!this.userInfo.familyId) {
        this.$message.error("用户信息不完整，请重新登录");
        this.$router.push("/website/family-login");
        return;
      }

      this.loading = true;
      getElderlyListByFamilyId(this.userInfo.familyId)
        .then((response) => {
          if (response.code === 200 && response.data) {
            // 直接获取老人信息对象
            this.elderlyInfo = response.data;
            this.loadTasks();
          } else {
            this.$message.warning("暂未绑定老人信息，请联系管理员");
          }
          this.loading = false;
        })
        .catch((error) => {
          this.$message.error(
            "加载老人信息失败：" + (error.message || "未知错误")
          );
          this.loading = false;
        });
    },
    loadTasks() {
      if (!this.elderlyInfo || !this.elderlyInfo.elderlyId) {
        this.taskList = [];
        return;
      }
      listNursingTask({ elderlyId: this.elderlyInfo.elderlyId, pageNum: 1, pageSize: 10 }).then((res) => {
        this.taskList = res.rows || [];
      });
    },
    // 加载最新活动记录
    loadRecentActivities() {
      if (!this.userInfo.familyId) {
        this.$message.error("用户信息不完整，请重新登录");
        this.$router.push("/website/family-login");
        return;
      }

      getFamilyRecentActivities(this.userInfo.familyId)
        .then((response) => {
          if (response.code === 200 && response.data) {
            // 转换数据格式以适配前端显示
            this.recentActivities = response.data.map((activity) => ({
              id: activity.activityId,
              time: this.formatActivityTime(activity.activityTime),
              content: activity.activityContent,
              type: activity.activityType,
            }));
          }
        })
        .catch((error) => {
          console.error("加载活动记录失败:", error);
          // 如果加载失败，使用默认的活动记录
          this.recentActivities = [
            {
              id: 1,
              time: "2024-01-15 14:30",
              content: "测试老人一号的健康报告已更新",
              type: "health",
            },
            {
              id: 2,
              time: "2024-01-15 10:20",
              content: "新增了测试老人一号的3张生活照片",
              type: "photo",
            },
            {
              id: 3,
              time: "2024-01-14 16:45",
              content: "护理人员回复了您的咨询",
              type: "communication",
            },
            {
              id: 4,
              time: "2024-01-14 09:15",
              content: "费用明细已更新",
              type: "fee",
            },
          ];
        });
    },

    // 加载最近一次健康报告
    loadLatestHealthReport() {
      if (!this.userInfo.familyId) {
        return;
      }

      getLatestHealthReport(this.userInfo.familyId)
        .then((response) => {
          if (response.code === 200 && response.data) {
            this.latestHealthReport = response.data;
          } else {
            this.latestHealthReport = {
              bloodPressure: "正常",
              heartRate: "正常",
              temperature: "正常",
              reportDate: null,
            };
          }
        })
        .catch((error) => {
          console.error("加载最近健康报告失败:", error);
          this.latestHealthReport = {
            bloodPressure: "正常",
            heartRate: "正常",
            temperature: "正常",
            reportDate: null,
          };
        });
    },
    // 格式化动态时间
    formatActivityTime(dateTime) {
      if (!dateTime) return "";
      const date = new Date(dateTime);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, "0");
      const day = String(date.getDate()).padStart(2, "0");
      const hours = String(date.getHours()).padStart(2, "0");
      const minutes = String(date.getMinutes()).padStart(2, "0");
      return `${year}-${month}-${day} ${hours}:${minutes}`;
    },

    // 血压状态评估
    getBloodPressureStatus(bloodPressure) {
      return evaluateBloodPressure(bloodPressure).status;
    },

    // 血压状态样式类
    getBloodPressureClass(bloodPressure) {
      return evaluateBloodPressure(bloodPressure).class;
    },

    // 心率状态评估
    getHeartRateStatus(heartRate) {
      return evaluateHeartRate(heartRate).status;
    },

    // 心率状态样式类
    getHeartRateClass(heartRate) {
      return evaluateHeartRate(heartRate).class;
    },

    // 体温状态评估
    getTemperatureStatus(temperature) {
      return evaluateTemperature(temperature).status;
    },

    // 体温状态样式类
    getTemperatureClass(temperature) {
      return evaluateTemperature(temperature).class;
    },

    // 格式化日期
    formatDate(dateTime) {
      if (!dateTime) return "";
      const date = new Date(dateTime);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, "0");
      const day = String(date.getDate()).padStart(2, "0");
      return `${year}-${month}-${day}`;
    },
    formatDateTime(dateTime) {
      if (!dateTime) return "";
      const d = new Date(dateTime);
      const y = d.getFullYear();
      const m = String(d.getMonth() + 1).padStart(2, "0");
      const day = String(d.getDate()).padStart(2, "0");
      const h = String(d.getHours()).padStart(2, "0");
      const min = String(d.getMinutes()).padStart(2, "0");
      return `${y}-${m}-${day} ${h}:${min}`;
    },
    getTaskStatusText(status) {
      const map = { "0": "待执行", "1": "已完成" };
      return map[status] || status || "未知";
    },
    // 获取护理等级文本
    getCareLevelText(level) {
      if (!level) return "未知";

      // 如果已经是文本，直接返回
      if (
        typeof level === "string" &&
        ["自理", "半自理", "不能自理", "特护"].includes(level)
      ) {
        return level;
      }

      // 如果是数字，进行映射
      const levels = {
        1: "自理",
        2: "半自理",
        3: "不能自理",
        4: "特护",
      };

      return levels[level] || level || "未知";
    },
    goToElderly() {
      this.$router.push("/family/elderly");
    },
    goToHealth() {
      this.$router.push("/family/health");
    },
    goToCommunication() {
      this.$router.push("/family/communication");
    },
    goToFee() {
      this.$router.push("/family/fee");
    },

    // 切换动态显示状态
    toggleActivities() {
      this.showAllActivities = !this.showAllActivities;
    },
    logout() {
      this.$confirm("确定要退出登录吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 清除用户信息
          localStorage.removeItem("family_user");
          sessionStorage.removeItem("family_user");
          this.$router.push("/website/family-login");
          this.$message.success("已退出登录");
        })
        .catch(() => {
          this.$message.info("已取消退出");
        });
    },
    getActivityTypeText(type) {
      const types = {
        health: "健康",
        photo: "照片",
        communication: "沟通",
        fee: "费用",
      };
      return types[type] || "其他";
    },
    getCurrentTime() {
      const now = new Date();
      const month = String(now.getMonth() + 1).padStart(2, "0");
      const day = String(now.getDate()).padStart(2, "0");
      const hours = String(now.getHours()).padStart(2, "0");
      const minutes = String(now.getMinutes()).padStart(2, "0");
      return `${month}-${day} ${hours}:${minutes}`;
    },

    // 加载官方通知
    loadNotices() {
      this.noticesLoading = true;
      listWebsiteNotice({
        pageNum: 1,
        pageSize: 5, // 只显示最新的5条通知
      })
        .then((response) => {
          if (response.code === 200 && response.rows) {
            this.notices = response.rows;
          } else {
            this.notices = [];
          }
          this.noticesLoading = false;
        })
        .catch((error) => {
          console.error("加载通知失败:", error);
          this.notices = [];
          this.noticesLoading = false;
          this.$message.error("加载通知失败");
        });
    },

    // 获取通知类型文本
    getNoticeTypeText(type) {
      const types = {
        1: "通知",
        2: "公告",
      };
      return types[type] || "通知";
    },

    // 获取通知类型样式类
    getNoticeTypeClass(type) {
      const classes = {
        1: "notice-type-notice",
        2: "notice-type-announcement",
      };
      return classes[type] || "notice-type-notice";
    },

    // 显示通知详情
    showNoticeDetail(notice) {
      this.$alert(notice.noticeContent, notice.noticeTitle, {
        dangerouslyUseHTMLString: true,
        confirmButtonText: "确定",
        customClass: "notice-detail-dialog",
      });
    },
    // 意见反馈相关方法
    openFeedback() {
      this.resetFeedback();
      this.feedbackOpen = true;
    },
    resetFeedback() {
      this.feedbackForm = {
        feedbackType: undefined,
        title: undefined,
        content: undefined,
        contactName: this.userInfo.familyName || this.userInfo.username,
        contactPhone: this.userInfo.phonenumber || undefined,
        elderlyId: this.elderlyInfo ? this.elderlyInfo.elderlyId : undefined,
        elderlyName: this.elderlyInfo
          ? this.elderlyInfo.elderlyName
          : undefined,
        feedbackStatus: "0",
        priority: "2",
      };
      this.resetForm("feedbackForm");
    },
    cancelFeedback() {
      this.feedbackOpen = false;
      this.resetFeedback();
    },
    submitFeedback() {
      this.$refs["feedbackForm"].validate((valid) => {
        if (valid) {
          // 确保关联老人信息是最新的
          if (this.elderlyInfo) {
            this.feedbackForm.elderlyId = this.elderlyInfo.elderlyId;
            this.feedbackForm.elderlyName = this.elderlyInfo.elderlyName;
          }

          addFeedback(this.feedbackForm).then((response) => {
            this.$modal.msgSuccess("提交成功");
            this.feedbackOpen = false;
          });
        }
      });
    },
    openCareProjects() {
      this.$router.push('/family/care')
    },
    resetBuyForm() {
      this.buyForm = {
        projectId: undefined,
        projectName: undefined,
        projectPrice: undefined,
        executeDate: undefined,
        executeTime: undefined,
        times: 1,
        nurseId: undefined,
        nurseName: undefined,
        remark: undefined,
      };
      if (this.$refs.buyForm) this.resetForm("buyForm");
    },
    loadLivingCareProjects() {
      listNursingProject({ projectType: "生活照料", pageNum: 1, pageSize: 100 }).then((res) => {
        const rows = res.rows || [];
        if (rows.length) {
          this.livingCareProjects = rows;
        } else {
          listNursingProject({ pageNum: 1, pageSize: 100 }).then((res2) => {
            const all = res2.rows || [];
            this.livingCareProjects = all.filter(
              (p) =>
                p.projectType === "生活照料" ||
                p.projectType === "1" ||
                p.projectType === "LIVING"
            );
            if (!this.livingCareProjects.length) {
              this.$message.warning("暂无生活照料项目");
            }
          });
        }
      });
    },
    loadNurses() {
      request({
        url: "/website/nurse/list",
        method: "get",
        params: { pageNum: 1, pageSize: 100, status: "0" },
        headers: { isToken: false },
      })
        .then((res) => {
          const rows = res.rows || [];
          this.nurseOptions = rows.map((u) => ({ userId: u.userId, nickName: u.nickName || u.userName }));
          if (!this.nurseOptions.length) {
            return listRole({ roleKey: "nurse", pageNum: 1, pageSize: 100 }).then((response) => {
              const nurseRole = (response.rows || []).find((item) => item.roleKey === "nurse");
              if (nurseRole) {
                return allocatedUserList({ roleId: nurseRole.roleId, pageNum: 1, pageSize: 100 }).then((r2) => {
                  this.nurseOptions = (r2.rows || []).map((u) => ({ userId: u.userId, nickName: u.nickName || u.userName }));
                });
              } else {
                this.nurseOptions = [];
              }
            });
          }
        })
        .catch(() => {
          listRole({ roleKey: "nurse", pageNum: 1, pageSize: 100 }).then((response) => {
            const nurseRole = (response.rows || []).find((item) => item.roleKey === "nurse");
            if (nurseRole) {
              allocatedUserList({ roleId: nurseRole.roleId, pageNum: 1, pageSize: 100 }).then((r2) => {
                this.nurseOptions = (r2.rows || []).map((u) => ({ userId: u.userId, nickName: u.nickName || u.userName }));
              });
            } else {
              this.nurseOptions = [];
            }
          });
        });
    },
    handleProjectChange(val) {
      const p = this.livingCareProjects.find((i) => i.projectId === val);
      if (p) {
        this.buyForm.projectName = p.projectName;
        this.buyForm.projectPrice = p.price;
      }
    },
    handleNurseChange(val) {
      const n = this.nurseOptions.find((i) => i.userId === val);
      if (n) {
        this.buyForm.nurseName = n.nickName;
      }
    },
    submitBuy() {
      this.$refs["buyForm"].validate((valid) => {
        if (!valid) return;
        if (!this.elderlyInfo || !this.elderlyInfo.elderlyId) {
          this.$message.error("未找到关联老人");
          return;
        }
        const times = Number(this.buyForm.times || 1);
        const date = this.buyForm.executeDate;
        const time = this.buyForm.executeTime;
        const dt = new Date(date);
        const [hh, mm] = String(time).split(":");
        dt.setHours(Number(hh || 0));
        dt.setMinutes(Number(mm || 0));
        const planTime = `${dt.getFullYear()}-${String(dt.getMonth() + 1).padStart(2, "0")}-${String(dt.getDate()).padStart(2, "0")} ${String(dt.getHours()).padStart(2, "0")}:${String(dt.getMinutes()).padStart(2, "0")}:00`;
        const payload = {
          elderlyId: this.elderlyInfo.elderlyId,
          elderlyName: this.elderlyInfo.elderlyName,
          projectId: this.buyForm.projectId,
          projectName: this.buyForm.projectName,
          projectPrice: this.buyForm.projectPrice,
          nurseId: this.buyForm.nurseId,
          nurseName: this.buyForm.nurseName,
          planTime: planTime,
          status: "0",
          taskRemark: this.buyForm.remark,
        };
        this.buySubmitting = true;
        const tasks = Array(times).fill(0).map(() => addNursingTask(payload));
        Promise.all(tasks)
          .then(() => {
            this.$modal.msgSuccess("购买成功，任务已创建");
            this.buyOpen = false;
            this.loadTasks();
          })
          .finally(() => {
            this.buySubmitting = false;
          });
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.family-dashboard {
  font-family: "PingFang SC", "Helvetica Neue", Helvetica, Arial, sans-serif;
  min-height: 100vh;
  background: #f5f7fa;
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

  i {
    font-size: 24px;
    margin-bottom: 10px;
    animation: rotating 2s linear infinite;
  }

  p {
    margin: 0;
    font-size: 14px;
  }
}

@keyframes rotating {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

// 顶部导航栏
.header {
  background: #fff;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 1000;

  .container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 70px;
  }

  .logo {
    h1 {
      margin: 0;
      color: #2c3e50;
      font-size: 24px;
      font-weight: 600;
    }
    p {
      margin: 0;
      color: #7f8c8d;
      font-size: 12px;
    }
  }

  .header-actions {
    display: flex;
    align-items: center;
    gap: 15px;

    .welcome-text {
      color: #666;
      font-size: 14px;
    }
  }
}

// 主要内容区域
.main-content {
  padding: 30px 0;
}

// 老人信息卡片
.elderly-card {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  margin-bottom: 30px;
  border: 1px solid #e8e8e8;

  .elderly-header {
    display: flex;
    align-items: center;
    padding: 25px;
    background: #f8f9fa;
    border-bottom: 1px solid #e8e8e8;

    .elderly-info {
      flex: 1;

      h2 {
        margin: 0 0 15px 0;
        font-size: 24px;
        font-weight: 600;
        color: #2c3e50;
      }

      .elderly-details {
        display: flex;
        flex-direction: column;
        gap: 8px;

        .detail-item {
          display: flex;
          align-items: center;
          font-size: 14px;

          .label {
            color: #666;
            margin-right: 8px;
            min-width: 80px;
          }

          .value {
            color: #333;
            font-weight: 500;

            &.care-level {
              background: #e8f5e8;
              color: #2e7d32;
              padding: 2px 8px;
              border-radius: 4px;
              font-size: 12px;
            }
          }
        }
      }
    }

    .elderly-status {
      text-align: right;

      .status-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 6px 12px;
        border-radius: 16px;
        font-size: 14px;
        font-weight: 500;
        margin-bottom: 8px;
        transition: all 0.3s ease;

        i {
          font-size: 12px;
        }

        // 正常状态
        &.status-normal {
          background: #e8f5e8;
          color: #2e7d32;
        }

        // 正常偏高状态
        &.status-warning {
          background: #fff3e0;
          color: #f57c00;
        }

        // 偏高状态
        &.status-high {
          background: #ffebee;
          color: #d32f2f;
        }

        // 偏低状态
        &.status-low {
          background: #e3f2fd;
          color: #1976d2;
        }

        // 未知状态
        &.status-unknown {
          background: #f5f5f5;
          color: #757575;
        }
      }

      .last-update {
        color: #999;
        font-size: 12px;
      }
    }
  }

  .elderly-summary {
    display: flex;
    padding: 20px 25px;
    background: #fff;
    border-top: 1px solid #f0f0f0;

    .summary-item {
      flex: 1;
      text-align: center;
      padding: 0 15px;

      &:not(:last-child) {
        border-right: 1px solid #f0f0f0;
      }

      .summary-label {
        color: #666;
        font-size: 12px;
        margin-bottom: 5px;
      }

      .summary-value {
        color: #333;
        font-size: 14px;
        font-weight: 500;
      }
    }
  }
}

// 功能菜单
.function-menu {
  margin-bottom: 30px;

  .menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
  }

  .menu-item {
    background: #fff;
    border-radius: 8px;
    padding: 20px;
    cursor: pointer;
    transition: all 0.3s ease;
    border: 1px solid #e8e8e8;
    display: flex;
    align-items: center;
    gap: 15px;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      border-color: #409eff;
    }

    .menu-icon {
      width: 50px;
      height: 50px;
      border-radius: 8px;
      background: #409eff;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 20px;
    }

    .menu-content {
      h3 {
        margin: 0 0 5px 0;
        color: #333;
        font-size: 16px;
        font-weight: 600;
      }

      p {
        margin: 0;
        color: #666;
        font-size: 14px;
      }
    }
  }
}

// 信息展示区域
.info-section {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;
  margin-bottom: 30px;

  @media (max-width: 1200px) {
    grid-template-columns: 1fr 1fr;
  }

  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.info-card {
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 25px;
    background: #f8f9fa;
    border-bottom: 1px solid #e8e8e8;

    h3 {
      margin: 0;
      color: #333;
      font-size: 16px;
      font-weight: 600;
    }
  }

  .card-content {
    padding: 20px 25px;
  }
}

// 活动列表
.activity-list {
  .activity-item {
    display: flex;
    padding: 12px 0;
    border-bottom: 1px solid #f0f0f0;

    &:last-child {
      border-bottom: none;
    }

    .activity-time {
      color: #999;
      font-size: 12px;
      width: 80px;
      flex-shrink: 0;
    }

    .activity-content {
      color: #333;
      flex: 1;
      font-size: 14px;
    }
  }

  .no-activity {
    text-align: center;
    padding: 20px 0;
    color: #999;
    font-size: 14px;
  }
}

// 展开收起按钮样式
.card-header {
  .el-button--text {
    color: #409eff;
    font-weight: 500;

    &:hover {
      color: #66b1ff;
    }
  }
}

// 健康状态网格
.health-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 15px;

  .health-item {
    text-align: center;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 6px;
    border: 2px solid transparent;
    transition: all 0.3s ease;

    .health-label {
      color: #666;
      font-size: 12px;
      margin-bottom: 5px;
    }

    .health-value {
      font-size: 16px;
      font-weight: 600;
      margin-bottom: 3px;
    }

    .health-detail {
      color: #999;
      font-size: 11px;
    }

    // 正常状态
    &.health-normal .health-value {
      color: #52c41a;
    }

    // 警告状态
    &.health-warning {
      border-color: #faad14;
      background: #fffbe6;

      .health-value {
        color: #faad14;
      }
    }

    // 异常状态（偏高/发热/偏快）
    &.health-high {
      border-color: #ff4d4f;
      background: #fff2f0;

      .health-value {
        color: #ff4d4f;
      }
    }

    // 异常状态（偏低/偏慢）
    &.health-low {
      border-color: #1890ff;
      background: #f0f9ff;

      .health-value {
        color: #1890ff;
      }
    }
  }
}

// 健康状态页脚
.health-footer {
  margin-top: 15px;
  padding-top: 15px;
  border-top: 1px solid #eee;
  text-align: center;

  .report-date {
    color: #999;
    font-size: 12px;
  }
}

// 通知卡片样式
.notice-card {
  .card-header {
    h3 {
      display: flex;
      align-items: center;
      gap: 8px;

      i {
        color: #409eff;
        font-size: 16px;
      }
    }
  }
}

// 通知列表样式
.notice-list {
  .notice-item {
    padding: 15px 0;
    border-bottom: 1px solid #f0f0f0;
    transition: all 0.3s ease;

    &:last-child {
      border-bottom: none;
    }

    &:hover {
      background: #f8f9fa;
      margin: 0 -15px;
      padding: 15px;
      border-radius: 6px;
    }

    .notice-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 8px;

      .notice-title {
        font-size: 14px;
        font-weight: 600;
        color: #333;
        flex: 1;
        margin-right: 10px;
        line-height: 1.4;
      }

      .notice-type {
        padding: 2px 8px;
        border-radius: 12px;
        font-size: 11px;
        font-weight: 500;
        white-space: nowrap;

        &.notice-type-notice {
          background: #e3f2fd;
          color: #1976d2;
        }

        &.notice-type-announcement {
          background: #fff3e0;
          color: #f57c00;
        }
      }
    }

    .notice-content {
      color: #666;
      font-size: 13px;
      line-height: 1.5;
      margin-bottom: 10px;
      max-height: 80px;
      overflow: hidden;
      position: relative;

      // 处理HTML内容样式
      :deep(*) {
        margin: 0;
        padding: 0;
        font-size: 13px;
        line-height: 1.5;
        color: #666;
      }

      // 处理图片样式
      :deep(img) {
        max-width: 100%;
        height: auto;
        border-radius: 4px;
        margin: 2px 0;
        display: block;
      }

      // 处理段落样式
      :deep(p) {
        margin: 0 0 5px 0;
        line-height: 1.5;

        &:last-child {
          margin-bottom: 0;
        }
      }

      // 处理标题样式
      :deep(h1, h2, h3, h4, h5, h6) {
        font-size: 14px;
        font-weight: 600;
        margin: 0 0 5px 0;
        color: #333;
      }

      // 处理列表样式
      :deep(ul, ol) {
        margin: 0;
        padding-left: 15px;
      }

      :deep(li) {
        margin: 2px 0;
      }

      // 处理链接样式
      :deep(a) {
        color: #409eff;
        text-decoration: none;

        &:hover {
          text-decoration: underline;
        }
      }

      // 处理强调文本
      :deep(strong, b) {
        font-weight: 600;
        color: #333;
      }

      // 处理斜体文本
      :deep(em, i) {
        font-style: italic;
      }

      // 添加渐变遮罩效果，让内容看起来更自然
      &::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 20px;
        background: linear-gradient(transparent, #fff);
        pointer-events: none;
      }
    }

    .notice-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;

      .notice-time {
        color: #999;
        font-size: 11px;
      }

      .el-button--text {
        color: #409eff;
        font-size: 12px;
        padding: 0;

        &:hover {
          color: #66b1ff;
        }
      }
    }
  }

  .no-notice {
    text-align: center;
    padding: 40px 0;
    color: #999;
    font-size: 14px;

    p {
      margin: 0;
    }
  }
}

// 页脚
.footer {
  background: #2c3e50;
  color: white;
  margin-top: 50px;

  .footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 30px;
    padding: 40px 0;

    .footer-section {
      h4 {
        margin: 0 0 15px 0;
        color: white;
        font-size: 16px;
        font-weight: 600;
      }

      p {
        margin: 0 0 8px 0;
        color: #bdc3c7;
        font-size: 14px;
        line-height: 1.5;
      }
    }
  }

  .footer-bottom {
    border-top: 1px solid #34495e;
    padding: 20px 0;
    text-align: center;

    p {
      margin: 0;
      color: #bdc3c7;
      font-size: 12px;
    }
  }
}

// 响应式设计
@media (max-width: 768px) {
  .container {
    padding: 0 15px;
  }

  .elderly-header {
    flex-direction: column;
    text-align: center;

    .elderly-status {
      text-align: center;
      margin-top: 15px;
    }
  }

  .elderly-summary {
    flex-direction: column;
    gap: 15px;

    .summary-item {
      border-right: none;
      border-bottom: 1px solid #f0f0f0;
      padding: 10px 0;

      &:last-child {
        border-bottom: none;
      }
    }
  }

  .menu-grid {
    grid-template-columns: 1fr;
  }

  .health-grid {
    grid-template-columns: 1fr;
  }
}
</style>

<style lang="scss">
// 通知详情对话框样式
.notice-detail-dialog {
  .el-message-box__title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
  }

  .el-message-box__content {
    max-height: 500px;
    overflow-y: auto;
    line-height: 1.6;
    padding: 20px;

    // 处理段落样式
    p {
      margin: 0 0 15px 0;
      line-height: 1.6;

      &:last-child {
        margin-bottom: 0;
      }
    }

    // 处理图片样式
    img {
      max-width: 100%;
      height: auto;
      border-radius: 6px;
      margin: 10px 0;
      display: block;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    // 处理标题样式
    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      font-weight: 600;
      margin: 15px 0 10px 0;
      color: #333;
      line-height: 1.4;
    }

    h1 {
      font-size: 18px;
    }
    h2 {
      font-size: 16px;
    }
    h3 {
      font-size: 15px;
    }
    h4,
    h5,
    h6 {
      font-size: 14px;
    }

    // 处理列表样式
    ul,
    ol {
      margin: 10px 0;
      padding-left: 20px;
    }

    li {
      margin: 5px 0;
      line-height: 1.5;
    }

    // 处理链接样式
    a {
      color: #409eff;
      text-decoration: none;

      &:hover {
        text-decoration: underline;
      }
    }

    // 处理强调文本
    strong,
    b {
      font-weight: 600;
      color: #333;
    }

    // 处理斜体文本
    em,
    i {
      font-style: italic;
    }

    // 处理引用样式
    blockquote {
      margin: 15px 0;
      padding: 10px 15px;
      background: #f8f9fa;
      border-left: 4px solid #409eff;
      border-radius: 0 4px 4px 0;
      font-style: italic;
      color: #666;
    }

    // 处理代码样式
    code {
      background: #f1f3f4;
      padding: 2px 6px;
      border-radius: 3px;
      font-family: "Courier New", monospace;
      font-size: 12px;
      color: #d63384;
    }

    pre {
      background: #f8f9fa;
      padding: 15px;
      border-radius: 6px;
      overflow-x: auto;
      margin: 15px 0;

      code {
        background: none;
        padding: 0;
        color: #333;
      }
    }

    // 处理表格样式
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 15px 0;

      th,
      td {
        border: 1px solid #dee2e6;
        padding: 8px 12px;
        text-align: left;
      }

      th {
        background: #f8f9fa;
        font-weight: 600;
        color: #333;
      }
    }
  }
}
</style>
