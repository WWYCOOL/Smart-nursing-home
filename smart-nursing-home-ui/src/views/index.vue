<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="16" style="padding-left: 20px">
        <h2>🏥 智慧养老院管理系统</h2>
        <p>
          欢迎使用智慧养老院管理系统！这是一个专为养老院设计的综合管理平台，为老人提供全方位的数字化服务。
        </p>
        
        <!-- 系统概览 -->
        <el-card class="overview-card" style="margin-top: 20px;">
          <div slot="header" class="clearfix">
            <span>📊 系统概览</span>
          </div>
          <el-row :gutter="20">
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-number">{{ stats.elderlyCount }}</div>
                <div class="stat-label">在院老人</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-number">{{ stats.familyCount }}</div>
                <div class="stat-label">家属用户</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-number">{{ stats.healthReports }}</div>
                <div class="stat-label">健康报告</div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="stat-item">
                <div class="stat-number">{{ stats.newsCount }}</div>
                <div class="stat-label">新闻动态</div>
              </div>
            </el-col>
          </el-row>
        </el-card>

        <!-- 快速操作 -->
        <el-card class="quick-actions" style="margin-top: 20px;">
          <div slot="header" class="clearfix">
            <span>⚡ 快速操作</span>
          </div>
          <el-row :gutter="15">
            <el-col :span="8">
              <el-button type="primary" icon="el-icon-user" @click="goToPage('/business/elderly-info')" style="width: 100%;">
                老人信息管理
              </el-button>
            </el-col>
            <el-col :span="8">
              <el-button type="success" icon="el-icon-document" @click="goToPage('/business/health-report')" style="width: 100%;">
                健康报告
              </el-button>
            </el-col>
            <el-col :span="8">
              <el-button type="warning" icon="el-icon-news" @click="goToPage('/system/website/news')" style="width: 100%;">
                新闻管理
              </el-button>
            </el-col>
          </el-row>
          <el-row :gutter="15" style="margin-top: 15px;">
            <el-col :span="8">
              <el-button type="info" icon="el-icon-s-platform" @click="goToPage('/system/website/facilities')" style="width: 100%;">
                设施管理
              </el-button>
            </el-col>
            <el-col :span="8">
              <el-button type="danger" icon="el-icon-setting" @click="goToPage('/system/website/health-standards')" style="width: 100%;">
                健康标准
              </el-button>
            </el-col>
            <el-col :span="8">
              <el-button type="primary" icon="el-icon-view" @click="goToWebsite()" style="width: 100%;">
                查看网站
              </el-button>
            </el-col>
          </el-row>
        </el-card>

        <!-- 最近活动 -->
        <el-card class="recent-activities" style="margin-top: 20px;">
          <div slot="header" class="clearfix">
            <span>📈 最近活动</span>
          </div>
          <el-timeline>
            <el-timeline-item
              v-for="activity in recentActivities"
              :key="activity.id"
              :timestamp="activity.time"
              :type="activity.type"
            >
              {{ activity.content }}
            </el-timeline-item>
          </el-timeline>
        </el-card>
      </el-col>
      
      <el-col :sm="24" :lg="8" style="padding-left: 20px">
        <!-- 网站预览 -->
        <el-card class="website-preview">
          <div slot="header" class="clearfix">
            <span>🌐 网站预览</span>
          </div>
          <div class="preview-content">
            <div class="preview-item" @click="goToWebsite('/website/home')">
              <i class="el-icon-house"></i>
              <span>网站首页</span>
            </div>
            <div class="preview-item" @click="goToWebsite('/website/about')">
              <i class="el-icon-info"></i>
              <span>关于我们</span>
            </div>
            <div class="preview-item" @click="goToWebsite('/website/services')">
              <i class="el-icon-service"></i>
              <span>服务项目</span>
            </div>
            <div class="preview-item" @click="goToWebsite('/website/facilities-display')">
              <i class="el-icon-s-platform"></i>
              <span>设施环境</span>
            </div>
            <div class="preview-item" @click="goToWebsite('/website/news-display')">
              <i class="el-icon-news"></i>
              <span>新闻动态</span>
            </div>
            <div class="preview-item" @click="goToWebsite('/website/contact')">
              <i class="el-icon-phone"></i>
              <span>联系我们</span>
            </div>
          </div>
        </el-card>

        <!-- 系统信息 -->
        <el-card class="system-info" style="margin-top: 20px;">
          <div slot="header" class="clearfix">
            <span>ℹ️ 系统信息</span>
          </div>
          <div class="info-item">
            <span class="info-label">系统版本：</span>
            <span class="info-value">v{{ version }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">运行时间：</span>
            <span class="info-value">{{ runTime }}</span>
          </div>
          <div class="info-item">
            <span class="info-label">最后更新：</span>
            <span class="info-value">{{ lastUpdate }}</span>
          </div>
        </el-card>

        <!-- 健康提醒 -->
        <el-card class="health-reminder" style="margin-top: 20px;">
          <div slot="header" class="clearfix">
            <span>💊 健康提醒</span>
          </div>
          <div class="reminder-content">
            <div class="reminder-item">
              <i class="el-icon-warning" style="color: #E6A23C;"></i>
              <span>定期检查老人健康状况</span>
            </div>
            <div class="reminder-item">
              <i class="el-icon-info" style="color: #409EFF;"></i>
              <span>及时更新健康报告</span>
            </div>
            <div class="reminder-item">
              <i class="el-icon-success" style="color: #67C23A;"></i>
              <span>保持与家属的沟通</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { getOverviewStatistics } from '@/api/website/statistics'

export default {
  name: "Index",
  data() {
    return {
      version: "3.9.0",
      stats: {
        elderlyCount: 0,
        familyCount: 0,
        healthReports: 0,
        newsCount: 0
      },
      recentActivities: [
        {
          id: 1,
          content: "新增了2位老人的健康报告",
          time: "2025-01-15 14:30",
          type: "primary"
        },
        {
          id: 2,
          content: "发布了新的新闻动态",
          time: "2025-01-15 10:20",
          type: "success"
        },
        {
          id: 3,
          content: "家属登录系统查看老人信息",
          time: "2025-01-14 16:45",
          type: "warning"
        },
        {
          id: 4,
          content: "更新了设施环境信息",
          time: "2025-01-14 09:15",
          type: "info"
        }
      ],
      runTime: "运行中",
      lastUpdate: "2025-01-15"
    };
  },
  created() {
    this.loadStats();
  },
  methods: {
    loadStats() {
      // 从后端API获取真实统计数据
      getOverviewStatistics().then(response => {
        if (response.code === 200) {
          this.stats = {
            elderlyCount: response.data.elderlyCount || 0,
            familyCount: response.data.familyCount || 0,
            healthReports: response.data.healthReports || 0,
            newsCount: response.data.newsCount || 0
          };
        } else {
          console.error('获取统计数据失败:', response.msg);
          // 如果API失败，使用默认值
          this.stats = {
            elderlyCount: 0,
            familyCount: 0,
            healthReports: 0,
            newsCount: 0
          };
        }
      }).catch(error => {
        console.error('获取统计数据失败:', error);
        // 如果API失败，使用默认值
        this.stats = {
          elderlyCount: 0,
          familyCount: 0,
          healthReports: 0,
          newsCount: 0
        };
      });
    },
    goToPage(path) {
      this.$router.push(path);
    },
    goToWebsite(path = '/website/home') {
      window.open(path, '_blank');
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.home {
  .overview-card {
    .stat-item {
      text-align: center;
      padding: 20px 0;
      .stat-number {
        font-size: 32px;
        font-weight: bold;
        color: #FF8C42;
        margin-bottom: 8px;
      }
      .stat-label {
        font-size: 14px;
        color: #666;
      }
    }
  }

  .quick-actions {
    .el-button {
      margin-bottom: 10px;
    }
  }

  .website-preview {
    .preview-content {
      .preview-item {
        display: flex;
        align-items: center;
        padding: 12px 0;
        cursor: pointer;
        border-bottom: 1px solid #f0f0f0;
        transition: all 0.3s;
        
        &:hover {
          background-color: #f8f9fa;
          padding-left: 10px;
        }
        
        &:last-child {
          border-bottom: none;
        }
        
        i {
          margin-right: 10px;
          font-size: 16px;
          color: #FF8C42;
        }
        
        span {
          font-size: 14px;
        }
      }
    }
  }

  .system-info {
    .info-item {
      display: flex;
      justify-content: space-between;
      padding: 8px 0;
      border-bottom: 1px solid #f0f0f0;
      
      &:last-child {
        border-bottom: none;
      }
      
      .info-label {
        color: #666;
        font-size: 14px;
      }
      
      .info-value {
        color: #333;
        font-weight: 500;
      }
    }
  }

  .health-reminder {
    .reminder-content {
      .reminder-item {
        display: flex;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #f0f0f0;
        
        &:last-child {
          border-bottom: none;
        }
        
        i {
          margin-right: 10px;
          font-size: 16px;
        }
        
        span {
          font-size: 14px;
          color: #666;
        }
      }
    }
  }

  .recent-activities {
    .el-timeline-item__content {
      font-size: 14px;
    }
  }
}
</style>
