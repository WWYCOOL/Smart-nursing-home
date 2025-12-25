<template>
  <div class="website-home">
    <!-- 顶部导航栏 -->
    <header class="header">
      <div class="container">
        <div class="logo">
          <h1>智慧养老院</h1>
          <p>让爱陪伴每一天</p>
        </div>
        <nav class="nav">
          <ul>
            <li><a href="#home" @click="scrollTo('home')">首页</a></li>
            <li><a @click="$router.push('/website/about')">关于我们</a></li>
            <li><a @click="$router.push('/website/services')">服务项目</a></li>
            <li><a @click="$router.push('/website/facilities-display')">设施环境</a></li>
            <li><a @click="$router.push('/website/news-display')">新闻动态</a></li>
            <li><a @click="$router.push('/website/contact')">联系我们</a></li>
          </ul>
        </nav>
        <div class="header-actions">
          <el-button type="primary" @click="$router.push('/website/appointment-visit')">在线预约</el-button>
          <el-button @click="$router.push('/website/family-login')">家属登录</el-button>
        </div>
      </div>
    </header>

    <!-- 首页轮播图 -->
    <section id="home" class="hero-section">
      <el-carousel v-if="carouselList.length > 0" :interval="5000" arrow="hover" height="600px">
        <el-carousel-item v-for="carousel in carouselList" :key="carousel.carouselId">
          <div class="carousel-item" :style="`background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('${getImageUrl(carousel.imageUrl)}') center/cover;`">
            <div class="carousel-content">
              <h2>{{ carousel.title }}</h2>
              <p>{{ carousel.description }}</p>
              <el-button type="primary" size="large" @click="handleCarouselClick(carousel)">了解更多</el-button>
            </div>
          </div>
        </el-carousel-item>
      </el-carousel>
      <!-- 默认轮播图（当没有数据时显示） -->
      <el-carousel v-else :interval="5000" arrow="hover" height="600px">
        <el-carousel-item>
          <div class="carousel-item" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover;">
            <div class="carousel-content">
              <h2>温馨的家，专业的爱</h2>
              <p>为每一位老人提供最贴心的养老服务</p>
              <el-button type="primary" size="large" @click="$router.push('/website/contact')">联系我们</el-button>
            </div>
          </div>
        </el-carousel-item>
      </el-carousel>
    </section>

    <!-- 关于我们 -->
    <section id="about" class="about-section">
      <div class="container">
        <div class="section-header">
          <h2>关于我们</h2>
          <p>专业、温馨、贴心的养老服务</p>
          <el-button type="primary" @click="$router.push('/website/about')">了解更多</el-button>
        </div>
        <div class="about-content">
          <div class="about-text">
            <h3>智慧养老院简介</h3>
            <p>我们是一家专业的养老服务机构，致力于为老年人提供高品质的养老服务。自成立以来，我们始终坚持以"让每一位老人都能安享晚年"为使命，为入住老人提供全方位的照护服务。</p>
            <p>我们拥有专业的护理团队、完善的设施设备、温馨的居住环境，让每一位老人都能在这里感受到家的温暖。</p>
            <div class="stats">
              <div class="stat-item">
                <div class="stat-number">500+</div>
                <div class="stat-label">服务老人</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">15年</div>
                <div class="stat-label">专业经验</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">98%</div>
                <div class="stat-label">家属满意度</div>
              </div>
            </div>
          </div>
          <div class="about-image">
            <img src="https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="养老院环境">
          </div>
        </div>
      </div>
    </section>

    <!-- 服务项目 -->
    <section id="services" class="services-section">
      <div class="container">
        <div class="section-header">
          <h2>服务项目</h2>
          <p>全方位的专业养老服务</p>
          <el-button type="primary" @click="$router.push('/website/services')">了解更多</el-button>
        </div>
        <div class="services-grid">
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-user-solid"></i>
            </div>
            <h3>生活照料</h3>
            <p>24小时专业护理，包括日常起居、饮食照料、个人卫生等全方位生活服务。</p>
          </div>
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-first-aid-kit"></i>
            </div>
            <h3>医疗护理</h3>
            <p>专业医护团队，定期健康检查，药物管理，紧急医疗救助等医疗服务。</p>
          </div>
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-sunny"></i>
            </div>
            <h3>文娱活动</h3>
            <p>丰富多彩的文化娱乐活动，包括书法、绘画、音乐、舞蹈等，丰富老年生活。</p>
          </div>
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-food"></i>
            </div>
            <h3>营养膳食</h3>
            <p>专业营养师配餐，根据老人健康状况和口味偏好，提供营养均衡的膳食。</p>
          </div>
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-house"></i>
            </div>
            <h3>居住环境</h3>
            <p>温馨舒适的居住环境，无障碍设计，安全设施完善，让老人住得安心。</p>
          </div>
          <div class="service-card">
            <div class="service-icon">
              <i class="el-icon-phone"></i>
            </div>
            <h3>家属沟通</h3>
            <p>定期向家属汇报老人情况，建立家属微信群，随时沟通老人生活状态。</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 设施环境 -->
    <section id="facilities" class="facilities-section">
      <div class="container">
        <div class="section-header">
          <h2>设施环境</h2>
          <p>完善的设施配套，为老人提供舒适的生活环境</p>
          <el-button type="primary" @click="$router.push('/website/facilities-display')">了解更多</el-button>
        </div>
        <div class="facilities-types">
          <div class="facility-type" v-for="type in facilityTypes" :key="type.type">
            <div class="facility-icon" :style="{ borderColor: type.color }">
              <i :class="type.icon" :style="{ color: type.color }"></i>
            </div>
            <div class="facility-content">
              <h3>{{ type.name }}</h3>
              <p>{{ type.description }}</p>
              <div class="facility-features">
                <span v-for="feature in type.features" :key="feature" class="feature-tag">{{ feature }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 新闻动态 -->
    <section id="news" class="news-section">
      <div class="container">
        <div class="section-header">
          <h2>热点新闻</h2>
          <p>了解我们的最新动态和重要信息</p>
          <el-button type="primary" @click="$router.push('/website/news-display')">查看更多新闻</el-button>
        </div>
        
        <!-- 加载状态 -->
        <div v-if="loading.news" class="loading-container">
          <i class="el-icon-loading"></i>
          <p>加载中...</p>
        </div>
        
        <!-- 热点新闻列表 -->
        <div v-else-if="newsList.length > 0" class="news-grid">
          <div class="news-item" v-for="news in newsList" :key="news.newsId">
            <div class="news-image">
              <img :src="getImageUrl(news.imageUrl)" :alt="news.title" @error="handleImageError">
            </div>
            <div class="news-content">
              <div class="news-date">{{ formatDate(news.createTime) }}</div>
              <h3 class="news-title">{{ news.title }}</h3>
              <p class="news-summary">{{ news.summary || (news.content ? news.content.substring(0, 80) + '...' : '暂无摘要') }}</p>
            </div>
          </div>
        </div>
        
        <!-- 空状态 -->
        <div v-else class="empty-news">
          <i class="el-icon-document"></i>
          <p>暂无热点新闻</p>
        </div>
      </div>
    </section>


    <!-- 页脚 -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section">
            <h3>智慧养老院</h3>
            <p>让爱陪伴每一天，为每一位老人提供最贴心的养老服务。</p>
          </div>
          <div class="footer-section">
            <h4>快速链接</h4>
            <ul>
              <li><a @click="$router.push('/website/about')">关于我们</a></li>
              <li><a @click="$router.push('/website/services')">服务项目</a></li>
              <li><a @click="$router.push('/website/facilities-display')">设施环境</a></li>
              <li><a @click="$router.push('/website/news-display')">新闻动态</a></li>
            </ul>
          </div>
          <div class="footer-section">
            <h4>联系方式</h4>
            <p>地址：北京市朝阳区智慧养老院路123号</p>
            <p>电话：400-123-4567</p>
            <p>邮箱：info@nursinghome.com</p>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; 2024 智慧养老院. 保留所有权利.</p>
        </div>
      </div>
    </footer>

    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import BackToTop from '@/components/BackToTop'
import { listCarouselPublic } from '@/api/website/carousel'
import { listNewsPublic } from '@/api/website/news'

export default {
  name: 'WebsiteHome',
  components: {
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '智慧养老院 - 让爱陪伴每一天'
  },
  mounted() {
    // 确保标题设置生效
    document.title = '智慧养老院 - 让爱陪伴每一天'
    // 再次确保标题设置
    setTimeout(() => {
      document.title = '智慧养老院 - 让爱陪伴每一天'
    }, 100)
  },
  data() {
    return {
      carouselList: [],
      newsList: [],
      loading: {
        carousel: false,
        news: false
      },
      // 设施类型数据
      facilityTypes: [
        {
          type: 'room',
          name: '房间设施',
          description: '温馨舒适的居住空间，配备齐全的生活设施',
          icon: 'el-icon-house',
          features: ['单人间', '双人间', '豪华间', '无障碍设计'],
          color: '#28a745'
        },
        {
          type: 'public',
          name: '公共设施',
          description: '丰富的公共活动空间，满足老人社交娱乐需求',
          icon: 'el-icon-s-platform',
          features: ['活动室', '阅览室', '健身房', '花园庭院'],
          color: '#17a2b8'
        },
        {
          type: 'safety',
          name: '安全设施',
          description: '完善的安全保障系统，确保老人居住安全',
          icon: 'el-icon-lock',
          features: ['监控系统', '紧急呼叫', '防滑设施', '安全扶手'],
          color: '#ffc107'
        },
        {
          type: 'medical',
          name: '医疗设施',
          description: '专业的医疗配套设施，提供及时的健康保障',
          icon: 'el-icon-first-aid-kit',
          features: ['医务室', '康复室', '体检设备', '急救设备'],
          color: '#dc3545'
        }
      ],
    }
  },
  created() {
    this.getCarouselList()
    this.getNewsList()
  },
  methods: {
    // 获取轮播图数据
    getCarouselList() {
      this.loading.carousel = true
      listCarouselPublic().then(response => {
        console.log('轮播图API响应:', response)
        this.carouselList = response.data || []
        console.log('轮播图数据:', this.carouselList)
        // 打印每个轮播图的详细信息
        this.carouselList.forEach((carousel, index) => {
          console.log(`轮播图${index + 1}:`, {
            title: carousel.title,
            description: carousel.description,
            imageUrl: carousel.imageUrl,
            linkUrl: carousel.linkUrl,
            status: carousel.status
          })
        })
        this.loading.carousel = false
      }).catch((error) => {
        this.loading.carousel = false
        console.warn('获取轮播图数据失败，使用默认数据:', error)
        // 不显示错误消息，静默处理
      })
    },
    // 获取热点新闻数据
    getNewsList() {
      this.loading.news = true
      
      listNewsPublic({ 
        pageSize: 3, 
        status: '0', 
        isFeatured: 'Y'
      }).then(response => {
        // 检查不同的数据格式
        let newsData = []
        if (response.rows && response.rows.length > 0) {
          newsData = response.rows
        } else if (response.data && response.data.length > 0) {
          newsData = response.data
        }
        
        this.newsList = newsData
        this.loading.news = false
      }).catch((error) => {
        console.error('获取新闻数据失败:', error)
        this.loading.news = false
        this.newsList = []
      })
    },
    scrollTo(elementId) {
      const element = document.getElementById(elementId);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth' });
      }
    },
    // 处理轮播图点击
    handleCarouselClick(carousel) {
      if (carousel.linkUrl) {
        if (carousel.linkUrl.startsWith('http')) {
          window.open(carousel.linkUrl, '_blank')
        } else {
          this.$router.push(carousel.linkUrl)
        }
      } else {
        this.$router.push('/website/appointment-visit')
      }
    },
    // 处理图片URL
    getImageUrl(imageUrl) {
      if (!imageUrl) return ''
      // 如果是完整的URL（包含http或https），直接返回
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        return imageUrl
      }
      // 如果是相对路径，拼接服务器地址
      const fullUrl = 'http://localhost:8080' + imageUrl
      console.log('图片URL处理:', imageUrl, '->', fullUrl)
      return fullUrl
    },
    // 格式化日期
    formatDate(date) {
      if (!date) return ''
      const d = new Date(date)
      return d.getFullYear() + '-' + 
             String(d.getMonth() + 1).padStart(2, '0') + '-' + 
             String(d.getDate()).padStart(2, '0')
    },
    viewNews(news) {
      // 查看新闻详情
      this.$router.push(`/website/news-display/detail/${news.newsId}`)
    },
    
    // 处理图片加载错误
    handleImageError(event) {
      event.target.src = 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80'
    },
  }
}
</script>

<style lang="scss" scoped>
.website-home {
  font-family: 'PingFang SC', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

// 顶部导航栏
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  z-index: 1000;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

  .container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;
  }

  .logo {
    h1 {
      margin: 0;
      color: #2c3e50;
      font-size: 24px;
    }
    p {
      margin: 0;
      color: #7f8c8d;
      font-size: 12px;
    }
  }

  .nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;

    li {
      margin: 0 20px;

      a {
        text-decoration: none;
        color: #2c3e50;
        font-weight: 500;
        transition: color 0.3s;

        &:hover {
          color: #3498db;
        }
      }
    }
  }

  .header-actions {
    display: flex;
    gap: 10px;
  }
}

// 轮播图区域
.hero-section {
  margin-top: 80px;

  .carousel-item {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 600px;
    color: white;
    text-align: center;

    .carousel-content {
      h2 {
        font-size: 48px;
        margin-bottom: 20px;
        font-weight: 300;
      }
      p {
        font-size: 20px;
        margin-bottom: 30px;
        opacity: 0.9;
      }
    }
  }
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

// 关于我们
.about-section {
  padding: 80px 0;
  background: #f8f9fa;

  .about-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: center;

    .about-text {
      h3 {
        font-size: 28px;
        color: #2c3e50;
        margin-bottom: 20px;
      }
      p {
        font-size: 16px;
        line-height: 1.8;
        color: #5a6c7d;
        margin-bottom: 20px;
      }
    }

    .stats {
      display: flex;
      gap: 40px;
      margin-top: 40px;

      .stat-item {
        text-align: center;

        .stat-number {
          font-size: 36px;
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

    .about-image img {
      width: 100%;
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
  }
}

// 服务项目
.services-section {
  padding: 80px 0;

  .services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;

    .service-card {
      text-align: center;
      padding: 40px 20px;
      border-radius: 10px;
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

      h3 {
        font-size: 20px;
        color: #2c3e50;
        margin-bottom: 15px;
      }

      p {
        color: #7f8c8d;
        line-height: 1.6;
      }
    }
  }
}

// 设施环境
.facilities-section {
  padding: 80px 0;
  background: #f8f9fa;

  .facilities-types {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;
    margin-top: 50px;

    .facility-type {
      background: white;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;

      &:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      }

      .facility-icon {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: #f8f9fa;
        border: 3px solid #e9ecef;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 20px;
        transition: all 0.3s ease;

        i {
          font-size: 32px;
          transition: all 0.3s ease;
        }
      }

      .facility-content {
        h3 {
          margin: 0 0 15px;
          color: #2c3e50;
          font-size: 22px;
          font-weight: 600;
        }

        p {
          margin: 0 0 20px;
          color: #7f8c8d;
          line-height: 1.6;
          font-size: 14px;
        }

        .facility-features {
          display: flex;
          flex-wrap: wrap;
          gap: 8px;
          justify-content: center;

          .feature-tag {
            background: #e8f4fd;
            color: #3498db;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
          }
        }
      }
    }
  }
}

// 新闻动态
.news-section {
  padding: 80px 0;
  background: #f8f9fa;

  .loading-container {
    text-align: center;
    padding: 60px 0;
    color: #999;
    
    i {
      font-size: 24px;
      margin-bottom: 10px;
    }
  }

  .empty-news {
    text-align: center;
    padding: 60px 0;
    color: #999;
    
    i {
      font-size: 48px;
      margin-bottom: 20px;
      color: #ddd;
    }
    
    p {
      font-size: 16px;
    }
  }

  .news-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 15px;
    margin-top: 30px;

    .news-item {
      flex: 0 0 auto;
      width: 300px;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
      transition: all 0.3s ease;

      &:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
      }

      .news-image {
        position: relative;
        height: 100px;
        overflow: hidden;

        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          transition: transform 0.3s ease;
        }


        &:hover img {
          transform: scale(1.05);
        }
      }

      .news-content {
        padding: 10px;

        .news-date {
          color: #3498db;
          font-size: 10px;
          font-weight: 500;
          margin-bottom: 6px;
        }

        .news-title {
          font-size: 13px;
          color: #2c3e50;
          margin-bottom: 6px;
          line-height: 1.2;
          font-weight: 600;
          display: -webkit-box;
          -webkit-line-clamp: 2;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }

        .news-summary {
          color: #7f8c8d;
          line-height: 1.3;
          margin-bottom: 0;
          font-size: 11px;
          display: -webkit-box;
          -webkit-line-clamp: 1;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }

      }
    }
  }
}

// 联系我们

// 页脚
.footer {
  background: #2c3e50;
  color: white;
  padding: 60px 0 20px;

  .footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 40px;
    margin-bottom: 40px;

    h3, h4 {
      margin-bottom: 20px;
    }

    ul {
      list-style: none;
      padding: 0;

      li {
        margin-bottom: 10px;

        a {
          color: #bdc3c7;
          text-decoration: none;
          transition: color 0.3s;

          &:hover {
            color: white;
          }
        }
      }
    }

    p {
      color: #bdc3c7;
      line-height: 1.6;
    }
  }

  .footer-bottom {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid #34495e;
    color: #bdc3c7;
  }
}

// 响应式设计
@media (max-width: 768px) {
  .header .container {
    flex-direction: column;
    height: auto;
    padding: 20px;
  }

  .header .nav {
    margin: 20px 0;
  }

  .header .nav ul {
    flex-direction: column;
    text-align: center;
  }

  .about-content,
  .contact-content {
    grid-template-columns: 1fr;
    gap: 40px;
  }

  .stats {
    justify-content: center;
  }

  .hero-section .carousel-content h2 {
    font-size: 32px;
  }

  .hero-section .carousel-content p {
    font-size: 16px;
  }
}
</style>
