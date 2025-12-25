<template>
  <div class="about-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />


    <!-- 养老院简介 -->
    <section class="intro-section">
      <div class="container">
        <div class="intro-content">
          <div class="intro-text">
            <h2>智慧养老院简介</h2>
            <p>我们是一家专业的养老服务机构，成立于2008年，致力于为老年人提供高品质的养老服务。自成立以来，我们始终坚持以"让每一位老人都能安享晚年"为使命，为入住老人提供全方位的照护服务。</p>
            <p>我们拥有专业的护理团队、完善的设施设备、温馨的居住环境，让每一位老人都能在这里感受到家的温暖。经过15年的发展，我们已经服务了500多位老人，获得了98%的家属满意度。</p>
            <div class="intro-features">
              <div class="feature-item">
                <i class="el-icon-medicine-box"></i>
                <span>专业医疗护理</span>
              </div>
              <div class="feature-item">
                <i class="el-icon-house"></i>
                <span>温馨居住环境</span>
              </div>
              <div class="feature-item">
                <i class="el-icon-user-solid"></i>
                <span>24小时贴心服务</span>
              </div>
              <div class="feature-item">
                <i class="el-icon-sunny"></i>
                <span>丰富多彩活动</span>
              </div>
            </div>
          </div>
          <div class="intro-image">
            <img src="https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="养老院环境">
          </div>
        </div>
      </div>
    </section>

    <!-- 发展历程 -->
    <section class="history-section">
      <div class="container">
        <div class="section-header">
          <h2>发展历程</h2>
          <p>15年专业发展，见证我们的成长</p>
        </div>
        <div class="timeline">
          <div class="timeline-item" v-for="(item, index) in timelineData" :key="index">
            <div class="timeline-year">{{ item.year }}</div>
            <div class="timeline-content">
              <h3>{{ item.title }}</h3>
              <p>{{ item.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!-- 荣誉资质 -->
    <section class="honors-section">
      <div class="container">
        <div class="section-header">
          <h2>荣誉资质</h2>
          <p>专业认证，值得信赖</p>
        </div>
        <div class="honors-grid">
          <div class="honor-item" v-for="honor in honorsData" :key="honor.id">
            <div class="honor-icon">
              <i :class="honor.icon"></i>
            </div>
            <div class="honor-content">
              <h3>{{ honor.title }}</h3>
              <p>{{ honor.description }}</p>
              <span class="honor-year">{{ honor.year }}</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 数据统计 -->
    <section class="stats-section">
      <div class="container">
        <div class="section-header">
          <h2>我们的成就</h2>
          <p>用数据说话，用服务证明</p>
        </div>
        <div class="stats-grid">
          <div class="stat-item" v-for="stat in statsData" :key="stat.id">
            <div class="stat-icon">
              <i :class="stat.icon"></i>
            </div>
            <div class="stat-content">
              <h3>{{ stat.number }}</h3>
              <p>{{ stat.description }}</p>
              <span class="stat-label">{{ stat.label }}</span>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import WebsiteNavbar from '@/components/WebsiteNavbar'
import BackToTop from '@/components/BackToTop'

export default {
  name: 'AboutPage',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '关于我们 - 智慧养老院'
  },
  data() {
    return {
      timelineData: [
        {
          year: '2008',
          title: '成立初期',
          description: '智慧养老院正式成立，开始为老年人提供专业养老服务'
        },
        {
          year: '2012',
          title: '规模扩大',
          description: '扩建新楼，增加床位至200张，服务能力大幅提升'
        },
        {
          year: '2015',
          title: '专业认证',
          description: '获得ISO9001质量管理体系认证，服务标准化'
        },
        {
          year: '2018',
          title: '智慧升级',
          description: '引入智慧养老系统，实现数字化管理'
        },
        {
          year: '2021',
          title: '服务升级',
          description: '新增康复训练中心，提供更专业的康复服务'
        },
        {
          year: '2024',
          title: '持续发展',
          description: '服务老人超过5000位，家属满意度达98%'
        }
      ],
      honorsData: [
        {
          id: 1,
          icon: 'el-icon-medal',
          title: 'ISO9001质量管理体系认证',
          description: '通过国际质量管理体系认证，确保服务质量',
          year: '2015年'
        },
        {
          id: 2,
          icon: 'el-icon-trophy',
          title: '北京市优秀养老机构',
          description: '连续三年获得北京市优秀养老机构称号',
          year: '2020-2023年'
        },
        {
          id: 3,
          icon: 'el-icon-star-on',
          title: '五星级养老机构',
          description: '获得民政部五星级养老机构评定',
          year: '2022年'
        },
        {
          id: 4,
          icon: 'el-icon-document',
          title: '医疗执业许可证',
          description: '具备专业医疗护理资质',
          year: '2008年'
        }
      ],
      statsData: [
        {
          id: 1,
          number: '5000+',
          label: '服务老人',
          description: '累计服务老人超过5000位',
          icon: 'el-icon-user-solid'
        },
        {
          id: 2,
          number: '15年',
          label: '专业经验',
          description: '15年专业养老服务经验',
          icon: 'el-icon-time'
        },
        {
          id: 3,
          number: '98%',
          label: '家属满意度',
          description: '家属满意度高达98%',
          icon: 'el-icon-star-on'
        },
        {
          id: 4,
          number: '50+',
          label: '专业团队',
          description: '50多名专业护理人员',
          icon: 'el-icon-user-solid'
        },
        {
          id: 5,
          number: '200张',
          label: '床位数量',
          description: '提供200张专业养老床位',
          icon: 'el-icon-house'
        },
        {
          id: 6,
          number: '24小时',
          label: '全天服务',
          description: '24小时不间断专业服务',
          icon: 'el-icon-time'
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
.about-page {
  font-family: 'PingFang SC', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}


.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}


// 通用section样式
.section-header {
  text-align: center;
  margin-bottom: 60px;

  h2 {
    font-size: 36px;
    color: #2c3e50;
    margin-bottom: 10px;
  }
  p {
    font-size: 18px;
    color: #7f8c8d;
  }
}

// 简介部分
.intro-section {
  padding: 100px 0 80px;
  background: white;

  .intro-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: center;

    .intro-text {
      h2 {
        font-size: 32px;
        color: #2c3e50;
        margin-bottom: 20px;
      }

      p {
        font-size: 16px;
        line-height: 1.8;
        color: #5a6c7d;
        margin-bottom: 20px;
      }

      .intro-features {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-top: 30px;

        .feature-item {
          display: flex;
          align-items: center;
          padding: 15px;
          background: #f8f9fa;
          border-radius: 8px;

          i {
            font-size: 24px;
            color: #3498db;
            margin-right: 10px;
          }

          span {
            color: #2c3e50;
            font-weight: 500;
          }
        }
      }
    }

    .intro-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
  }
}

// 发展历程
.history-section {
  padding: 80px 0;
  background: #f8f9fa;

  .timeline {
    position: relative;
    max-width: 800px;
    margin: 0 auto;

    &::before {
      content: '';
      position: absolute;
      left: 50%;
      top: 0;
      bottom: 0;
      width: 2px;
      background: #3498db;
      transform: translateX(-50%);
    }

    .timeline-item {
      position: relative;
      margin-bottom: 40px;
      display: flex;
      align-items: center;

      &:nth-child(odd) {
        flex-direction: row;

        .timeline-year {
          margin-right: 30px;
        }
      }

      &:nth-child(even) {
        flex-direction: row-reverse;

        .timeline-year {
          margin-left: 30px;
        }
      }

      .timeline-year {
        background: #3498db;
        color: white;
        padding: 10px 20px;
        border-radius: 20px;
        font-weight: bold;
        font-size: 18px;
        min-width: 80px;
        text-align: center;
      }

      .timeline-content {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        flex: 1;

        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin: 0;
        }
      }
    }
  }
}


// 荣誉资质
.honors-section {
  padding: 80px 0;
  background: #f8f9fa;

  .honors-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;

    .honor-item {
      display: flex;
      align-items: center;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .honor-icon {
        font-size: 48px;
        color: #f39c12;
        margin-right: 20px;
      }

      .honor-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 10px;
        }

        .honor-year {
          color: #3498db;
          font-weight: 500;
          font-size: 14px;
        }
      }
    }
  }
}

// 数据统计
.stats-section {
  padding: 80px 0;
  background: #f8f9fa;

  .stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;

    .stat-item {
      display: flex;
      align-items: center;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .stat-icon {
        font-size: 48px;
        color: #f39c12;
        margin-right: 20px;
      }

      .stat-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 10px;
        }

        .stat-label {
          color: #3498db;
          font-weight: 500;
          font-size: 14px;
        }
      }
    }
  }
}


// 响应式设计
@media (max-width: 768px) {
  .page-header {
    padding: 60px 0;

    h1 {
      font-size: 36px;
    }
  }

  .intro-content {
    grid-template-columns: 1fr !important;
    gap: 40px !important;
  }

  .intro-features {
    grid-template-columns: 1fr !important;
  }

  .timeline {
    &::before {
      left: 20px !important;
    }

    .timeline-item {
      flex-direction: row !important;
      padding-left: 50px;

      .timeline-year {
        position: absolute;
        left: -40px;
        margin: 0 !important;
      }
    }
  }


  .stats-grid {
    grid-template-columns: 1fr !important;
  }
}
</style>
