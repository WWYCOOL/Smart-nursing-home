<template>
  <div class="services-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />
    

    <!-- 服务概览 -->
    <section class="services-overview">
      <div class="container">
        <div class="overview-content">
          <div class="overview-text">
            <h2>专业服务，贴心照护</h2>
            <p>我们为每一位老人提供全方位的专业养老服务，从日常生活照料到医疗护理，从营养膳食到文娱活动，每一个细节都体现着我们的专业和用心。</p>
            <div class="service-stats">
              <div class="stat-item">
                <div class="stat-number">24小时</div>
                <div class="stat-label">全天候服务</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">50+</div>
                <div class="stat-label">专业护理人员</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">98%</div>
                <div class="stat-label">服务满意度</div>
              </div>
            </div>
          </div>
          <div class="overview-image">
            <img src="https://q7.itc.cn/q_70/images01/20240718/379507b512154c7184a0e522f17a42ce.jpeg" alt="专业服务">
          </div>
        </div>
      </div>
    </section>

    <!-- 主要服务 -->
    <section class="main-services">
      <div class="container">
        <div class="section-header">
          <h2>主要服务项目</h2>
          <p>主流核心服务，满足不同需求</p>
        </div>
        <div class="services-grid">
          <div class="service-card" v-for="service in mainServices" :key="service.serviceId">
            <div class="service-icon">
              <i :class="service.serviceIcon"></i>
            </div>
            <div class="service-content">
              <h3>{{ service.serviceTitle }}</h3>
              <p>{{ service.serviceDescription }}</p>
              <ul class="service-features">
                <li v-for="feature in getServiceFeatures(service.serviceFeatures)" :key="feature">{{ feature }}</li>
              </ul>
              <div class="service-price">
                <span class="price-label">服务费用：</span>
                <span class="price-value">{{ service.servicePrice }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 医疗护理服务 -->
    <section class="medical-services">
      <div class="container">
        <div class="section-header">
          <h2>医疗护理服务</h2>
          <p>专业医疗团队，全方位健康保障</p>
        </div>
        <div class="medical-grid">
          <div class="medical-item" v-for="medical in medicalServices" :key="medical.serviceId">
            <div class="medical-icon">
              <i :class="medical.serviceIcon"></i>
            </div>
            <div class="medical-content">
              <h3>{{ medical.serviceTitle }}</h3>
              <p>{{ medical.serviceDescription }}</p>
              <div class="medical-details">
                <div class="detail-item">
                  <span class="detail-label">服务时间：</span>
                  <span class="detail-value">{{ medical.serviceTime }}</span>
                </div>
                <div class="detail-item">
                  <span class="detail-label">服务人员：</span>
                  <span class="detail-value">{{ medical.serviceStaff }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 生活照料服务 -->
    <section class="care-services">
      <div class="container">
        <div class="section-header">
          <h2>生活照料服务</h2>
          <p>24小时贴心照料，让生活更舒适</p>
        </div>
        
        <!-- 服务概览 -->
        <div class="care-overview">
          <div class="overview-stats">
            <div class="stat-item">
              <div class="stat-number">24小时</div>
              <div class="stat-label">全天候服务</div>
              </div>
            <div class="stat-item">
              <div class="stat-number">多个</div>
              <div class="stat-label">服务时段</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">专业</div>
              <div class="stat-label">护理团队</div>
          </div>
        </div>
        </div>

        <!-- 服务时间安排 -->
        <div class="care-schedule">
          <div class="schedule-header">
            <h3>服务时间安排</h3>
            <p>科学安排，贴心服务</p>
          </div>
          
          <!-- 服务网格 -->
          <div class="service-grid">
            <div 
              class="service-card" 
              v-for="care in careServices" 
              :key="care.serviceId"
            >
              <div class="card-header">
                <div class="time-badge">{{ care.serviceTime }}</div>
              </div>
              <div class="card-body">
                <h4>{{ care.serviceTitle }}</h4>
                <p>{{ care.serviceDescription }}</p>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>

    <!-- 文娱活动服务 -->
    <section class="activity-services">
      <div class="container">
        <div class="section-header">
          <h2>文娱活动服务</h2>
          <p>丰富多彩的活动，让晚年生活更精彩</p>
        </div>
        <div class="activity-grid">
          <div class="activity-category" v-for="category in activityCategories" :key="category.id">
            <div class="category-header">
              <i :class="category.icon"></i>
              <h3>{{ category.name }}</h3>
            </div>
            <div class="activity-list">
              <div class="activity-item" v-for="activity in category.activities" :key="activity.id">
                <div class="activity-info">
                  <h4>{{ activity.name }}</h4>
                  <p>{{ activity.description }}</p>
                  <div class="activity-meta">
                    <span class="activity-time">
                      <i class="el-icon-time"></i>
                      {{ activity.time }}
                    </span>
                    <span class="activity-location">
                      <i class="el-icon-location"></i>
                      {{ activity.location }}
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 营养膳食服务 -->
    <section class="nutrition-services">
      <div class="container">
        <div class="section-header">
          <h2>营养膳食服务</h2>
          <p>专业营养师配餐，健康美味每一天</p>
        </div>
        <div class="nutrition-content">
          <div class="nutrition-features">
            <div class="feature-item" v-for="feature in nutritionFeatures" :key="feature.featureId">
              <div class="feature-icon">
                <i :class="feature.featureIcon"></i>
              </div>
              <div class="feature-content">
                <h3>{{ feature.featureTitle }}</h3>
                <p>{{ feature.featureDescription }}</p>
              </div>
            </div>
          </div>
          <div class="nutrition-menu">
            <h3>今日菜单</h3>
            <div class="menu-grid">
              <div class="menu-item" v-for="menu in todayMenu" :key="menu.id">
                <div class="menu-time">{{ menu.time }}</div>
                <div class="menu-dishes">
                  <div class="dish-item" v-for="dish in menu.dishes" :key="dish">
                    <span class="dish-name">{{ dish.name }}</span>
                    <span class="dish-nutrition">{{ dish.nutrition }}</span>
                  </div>
                </div>
              </div>
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
import { listMainServicesPublic } from '@/api/website/main-services'
import { listMedicalServicesPublic } from '@/api/website/medical-services'
import { listCareServicesPublic } from '@/api/website/care-services'
import { listEntertainmentServicesPublic } from '@/api/website/entertainment-services'
import { listNutritionFeaturesPublic } from '@/api/website/nutrition-features'
import { listNutritionMenuPublic } from '@/api/website/nutrition-menu'

export default {
  name: 'ServicesPage',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '服务项目 - 智慧养老院'
  },
  data() {
    return {
      mainServices: [],
      medicalServices: [],
      careServices: [],
      entertainmentServices: [],
      activityCategories: [],
      nutritionFeatures: [],
      todayMenu: [],
    }
  },
  created() {
    this.loadMainServices()
    this.loadMedicalServices()
    this.loadCareServices()
    this.loadEntertainmentServices()
    this.loadNutritionFeatures()
    this.loadNutritionMenu()
  },
  methods: {
    // 加载主要服务项目数据
    async loadMainServices() {
      try {
        const response = await listMainServicesPublic()
        this.mainServices = response.data || []
      } catch (error) {
        console.warn('获取主要服务项目数据失败:', error)
        this.mainServices = []
      }
    },
    
    // 加载医疗护理服务数据
    async loadMedicalServices() {
      try {
        const response = await listMedicalServicesPublic()
        this.medicalServices = response.data || []
      } catch (error) {
        console.warn('获取医疗护理服务数据失败:', error)
        this.medicalServices = []
      }
    },
    
    // 加载生活照料服务数据
    async loadCareServices() {
      try {
        const response = await listCareServicesPublic()
        this.careServices = response.data || []
      } catch (error) {
        console.warn('获取生活照料服务数据失败:', error)
        this.careServices = []
      }
    },
    
    // 加载文娱活动服务数据
    async loadEntertainmentServices() {
      try {
        const response = await listEntertainmentServicesPublic()
        this.entertainmentServices = response.data || []
        this.processEntertainmentData()
      } catch (error) {
        console.warn('获取文娱活动服务数据失败:', error)
        this.entertainmentServices = []
        this.activityCategories = []
      }
    },
    
    // 处理文娱活动数据，按分类组织
    processEntertainmentData() {
      const categories = {}
      
      this.entertainmentServices.forEach(service => {
        const categoryId = service.categoryId
        const categoryName = service.categoryName
        const categoryIcon = service.categoryIcon
        
        if (!categories[categoryId]) {
          categories[categoryId] = {
            id: categoryId,
            name: categoryName,
            icon: categoryIcon,
            activities: []
          }
        }
        
        categories[categoryId].activities.push({
          id: service.activityId,
          name: service.activityName,
          description: service.activityDescription,
          time: service.activityTime,
          location: service.activityLocation
        })
      })
      
      // 转换为数组并按分类ID排序
      this.activityCategories = Object.values(categories).sort((a, b) => a.id - b.id)
    },
    
    // 解析服务特色
    getServiceFeatures(featuresJson) {
      if (!featuresJson) return []
      try {
        const features = JSON.parse(featuresJson)
        return Array.isArray(features) ? features : []
      } catch (e) {
        return []
      }
    },
    
    // 加载营养特色数据
    async loadNutritionFeatures() {
      try {
        const response = await listNutritionFeaturesPublic()
        this.nutritionFeatures = response.data || []
      } catch (error) {
        console.warn('获取营养特色数据失败:', error)
        this.nutritionFeatures = []
      }
    },
    
    // 加载今日菜单数据
    async loadNutritionMenu() {
      try {
        const response = await listNutritionMenuPublic()
        this.todayMenu = response.data || []
        // 处理菜单数据格式
        this.processMenuData()
      } catch (error) {
        console.warn('获取今日菜单数据失败:', error)
        this.todayMenu = []
      }
    },
    
    // 处理菜单数据格式
    processMenuData() {
      this.todayMenu = this.todayMenu.map(menu => {
        // 解析菜品信息
        let dishes = []
        if (menu.menuDishes) {
          try {
            dishes = JSON.parse(menu.menuDishes)
          } catch (e) {
            dishes = []
          }
        }
        
        return {
          id: menu.menuId,
          time: `${menu.mealName} (${menu.mealTime})`,
          dishes: dishes
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.services-page {
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

// 服务概览
.services-overview {
  padding: 100px 0 80px;
  background: white;

  .overview-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: center;

    .overview-text {
      h2 {
        font-size: 32px;
        color: #2c3e50;
        margin-bottom: 20px;
      }

      p {
        font-size: 16px;
        line-height: 1.8;
        color: #5a6c7d;
        margin-bottom: 30px;
      }

      .service-stats {
        display: flex;
        gap: 30px;

        .stat-item {
          text-align: center;

          .stat-number {
            font-size: 32px;
            font-weight: bold;
            color: #3498db;
            margin-bottom: 5px;
          }

          .stat-label {
            font-size: 14px;
            color: #7f8c8d;
          }
        }
      }
    }

    .overview-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
  }
}

// 主要服务
.main-services {
  padding: 80px 0;
  background: #f8f9fa;

  .services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;

    .service-card {
      background: white;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;

      &:hover {
        transform: translateY(-5px);
      }

      .service-icon {
        font-size: 48px;
        color: #3498db;
        margin-bottom: 20px;
      }

      .service-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 15px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 20px;
        }

        .service-features {
          list-style: none;
          padding: 0;
          margin-bottom: 20px;

          li {
            padding: 5px 0;
            color: #5a6c7d;
            position: relative;
            padding-left: 20px;

            &:before {
              content: '•';
              color: #3498db;
              position: absolute;
              left: 0;
            }
          }
        }

        .service-price {
          padding-top: 20px;
          border-top: 1px solid #f0f0f0;

          .price-label {
            color: #7f8c8d;
          }

          .price-value {
            color: #e74c3c;
            font-weight: bold;
            font-size: 18px;
          }
        }
      }
    }
  }
}

// 医疗护理服务
.medical-services {
  padding: 80px 0;
  background: white;

  .medical-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;

    .medical-item {
      display: flex;
      align-items: center;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .medical-icon {
        font-size: 48px;
        color: #e74c3c;
        margin-right: 20px;
      }

      .medical-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 15px;
        }

        .medical-details {
          .detail-item {
            margin-bottom: 5px;

            .detail-label {
              color: #7f8c8d;
              font-size: 14px;
            }

            .detail-value {
              color: #2c3e50;
              font-weight: 500;
            }
          }
        }
      }
    }
  }
}

// 生活照料服务
.care-services {
  padding: 80px 0;
  background: #f8f9fa;

  .section-header {
    text-align: center;
    margin-bottom: 60px;

    h2 {
      font-size: 36px;
      color: #2c3e50;
      margin-bottom: 15px;
      font-weight: 600;
    }

    p {
      font-size: 18px;
      color: #7f8c8d;
    }
  }

  // 服务概览
  .care-overview {
    margin-bottom: 60px;
    
    .overview-stats {
      display: flex;
      justify-content: center;
      gap: 80px;
      margin-top: 40px;
      
      .stat-item {
        text-align: center;
        
        .stat-number {
          font-size: 48px;
          font-weight: bold;
          color: #3498db;
          margin-bottom: 10px;
          line-height: 1;
        }
        
        .stat-label {
          font-size: 16px;
          color: #7f8c8d;
          font-weight: 500;
        }
      }
    }
  }

  // 服务时间安排
  .care-schedule {
    margin-bottom: 60px;
    
    .schedule-header {
      text-align: center;
      margin-bottom: 40px;
      
      h3 {
        font-size: 24px;
          color: #2c3e50;
        margin-bottom: 8px;
        font-weight: 600;
        }

        p {
        font-size: 14px;
          color: #7f8c8d;
      }
    }
    
    .service-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      max-width: 1200px;
      margin: 0 auto;
      
      .service-card {
        background: white;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        transition: all 0.3s ease;
        border-top: 3px solid #3498db;
        
        &:hover {
          transform: translateY(-2px);
          box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
          margin-bottom: 15px;
          
          .time-badge {
            background: #3498db;
            color: white;
            padding: 4px 12px;
            border-radius: 15px;
            font-weight: bold;
            font-size: 12px;
            display: inline-block;
          }
        }
        
        .card-body {
          h4 {
            color: #2c3e50;
            font-size: 16px;
            margin-bottom: 8px;
            font-weight: 600;
            line-height: 1.3;
          }
          
          p {
            color: #7f8c8d;
            line-height: 1.4;
            font-size: 13px;
            margin: 0;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
          }
        }
      }
    }
  }

}

// 文娱活动服务
.activity-services {
  padding: 80px 0;
  background: white;

  .activity-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;

    .activity-category {
      background: #f8f9fa;
      border-radius: 10px;
      padding: 30px;

      .category-header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;

        i {
          font-size: 32px;
          color: #3498db;
          margin-right: 15px;
        }

        h3 {
          color: #2c3e50;
          margin: 0;
        }
      }

      .activity-list {
        .activity-item {
          background: white;
          border-radius: 8px;
          padding: 20px;
          margin-bottom: 15px;
          box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

          .activity-info {
            h4 {
              color: #2c3e50;
              margin-bottom: 10px;
            }

            p {
              color: #7f8c8d;
              line-height: 1.6;
              margin-bottom: 15px;
            }

            .activity-meta {
              display: flex;
              gap: 20px;

              span {
                font-size: 14px;
                color: #5a6c7d;

                i {
                  margin-right: 5px;
                  color: #3498db;
                }
              }
            }
          }
        }
      }
    }
  }
}

// 营养膳食服务
.nutrition-services {
  padding: 80px 0;
  background: #f8f9fa;

  .nutrition-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;

    .nutrition-features {
      .feature-item {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

        .feature-icon {
          font-size: 32px;
          color: #f39c12;
          margin-right: 20px;
        }

        .feature-content {
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

    .nutrition-menu {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      h3 {
        color: #2c3e50;
        margin-bottom: 20px;
        text-align: center;
      }

      .menu-grid {
        .menu-item {
          margin-bottom: 20px;
          padding: 15px;
          background: #f8f9fa;
          border-radius: 8px;

          .menu-time {
            color: #3498db;
            font-weight: bold;
            margin-bottom: 10px;
          }

          .dish-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;

            .dish-name {
              color: #2c3e50;
            }

            .dish-nutrition {
              color: #7f8c8d;
              font-size: 14px;
            }
          }
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

  .overview-content,
  .nutrition-content {
    grid-template-columns: 1fr !important;
    gap: 40px !important;
  }

  .service-stats {
    justify-content: center;
  }

  // 生活照料服务响应式
  .care-services {
    padding: 40px 0;
    
    .section-header {
      h2 {
        font-size: 28px;
      }
      
      p {
        font-size: 16px;
      }
    }
    
    .care-overview {
      .overview-stats {
        flex-direction: column;
      gap: 30px;

      .stat-item {
        .stat-number {
            font-size: 36px;
          }
        }
      }
    }
    
    .care-schedule {
      .service-grid {
        grid-template-columns: 1fr;
        gap: 15px;
        
        .service-card {
          padding: 15px;
          
          .card-header {
            margin-bottom: 10px;
            
            .time-badge {
              font-size: 11px;
              padding: 3px 10px;
            }
          }
          
          .card-body {
            h4 {
              font-size: 14px;
            }
            
            p {
              font-size: 12px;
              -webkit-line-clamp: 3;
              line-clamp: 3;
            }
          }
        }
      }
    }
    
  }

  .activity-meta {
    flex-direction: column !important;
    gap: 10px !important;
  }
}
</style>
