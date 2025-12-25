<template>
  <div class="facilities-page" v-loading="loading">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />

    <!-- 环境概览 -->
    <section class="facilities-overview">
      <div class="container">
        <div class="overview-content">
          <div class="overview-text">
            <h2>温馨如家的居住环境</h2>
            <p>我们为每一位老人提供温馨舒适的居住环境，从房间设计到公共设施，每一个细节都体现着我们的用心。无障碍设计、安全设施完善，让老人住得安心、住得舒心。</p>
            <div class="facility-stats">
              <div class="stat-item">
                <div class="stat-number">400张+</div>
                <div class="stat-label">专业床位</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">10000㎡+</div>
                <div class="stat-label">建筑面积</div>
              </div>
              <div class="stat-item">
                <div class="stat-number">100%</div>
                <div class="stat-label">无障碍设计</div>
              </div>
            </div>
          </div>
          <div class="overview-image">
            <img src="https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="温馨如家的居住环境">
          </div>
        </div>
      </div>
    </section>

    <!-- 房间设施 -->
    <section class="room-facilities" v-if="roomTypes.length > 0">
      <div class="container">
        <div class="section-header">
          <h2>房间设施</h2>
          <p>温馨舒适的居住空间</p>
        </div>
        <div class="room-types">
          <div class="room-type" v-for="room in roomTypes" :key="room.facilityId">
            <div class="room-gallery">
              <el-carousel :interval="4000" arrow="hover" height="200px" v-if="getRoomImages(room).length > 0">
                <el-carousel-item v-for="(image, index) in getRoomImages(room)" :key="index">
                  <div class="carousel-item" :style="{ backgroundImage: `url(${getImageUrl(image)})` }" @error="handleImageError"></div>
                </el-carousel-item>
              </el-carousel>
              <div class="no-image-placeholder" v-else>
                <i class="el-icon-picture-outline"></i>
                <p>暂无图片</p>
              </div>
            </div>
            <div class="room-info">
              <div class="room-header">
                <h3>{{ room.facilityName }}</h3>
                <div class="room-type-badge" v-if="room.roomType">
                  <el-tag :type="getRoomTypeTagType(room.roomType)" size="small">
                    {{ getRoomTypeLabel(room.roomType) }}
                  </el-tag>
                </div>
              </div>
              
              <p class="room-description">{{ room.description }}</p>
              
              <div class="room-features" v-if="room.features">
                <div class="feature-item" v-for="feature in parseFeatures(room.features)" :key="feature">
                  <i class="el-icon-check"></i>
                  <span>{{ feature }}</span>
                </div>
              </div>
              
              <div class="room-details">
                <div class="detail-row">
                  <div class="detail-item" v-if="room.area">
                    <span class="detail-label">面积</span>
                  <span class="detail-value">{{ room.area }}</span>
                </div>
                  <div class="detail-item" v-if="room.beds">
                    <span class="detail-label">床位</span>
                  <span class="detail-value">{{ room.beds }}</span>
                </div>
                  <div class="detail-item" v-if="room.price">
                    <span class="detail-label">月费</span>
                  <span class="detail-value price">{{ room.price }}</span>
                </div>
              </div>
                
                <div class="detail-row" v-if="room.orientation || room.floor">
                  <div class="detail-item" v-if="room.orientation">
                    <span class="detail-label">朝向</span>
                    <span class="detail-value">{{ getOrientationLabel(room.orientation) }}</span>
                  </div>
                  <div class="detail-item" v-if="room.floor">
                    <span class="detail-label">楼层</span>
                    <span class="detail-value">{{ room.floor }}楼</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 公共设施 -->
    <section class="public-facilities" v-if="publicFacilities.length > 0">
      <div class="container">
        <div class="section-header">
          <h2>公共设施</h2>
          <p>完善的公共设施，丰富老年生活</p>
        </div>
        <div class="facilities-grid">
          <div class="facility-item" v-for="facility in publicFacilities" :key="facility.facilityId">
            <div class="facility-image">
              <img :src="getImageUrl(facility.imageUrl)" :alt="facility.facilityName">
              <div class="facility-overlay">
                <h3>{{ facility.facilityName }}</h3>
                <p>{{ facility.description }}</p>
                <div class="facility-features" v-if="facility.features">
                  <el-tag v-for="feature in parseFeatures(facility.features)" :key="feature" size="small">{{ feature }}</el-tag>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 安全设施 -->
    <section class="safety-facilities" v-if="safetyFacilities.length > 0">
      <div class="container">
        <div class="section-header">
          <h2>安全设施</h2>
          <p>全方位安全保障，让家属放心</p>
        </div>
        <div class="safety-grid">
          <div class="safety-item" v-for="safety in safetyFacilities" :key="safety.facilityId">
            <div class="safety-icon">
              <i :class="safety.iconClass || 'el-icon-shield'"></i>
            </div>
            <div class="safety-content">
              <h3>{{ safety.facilityName }}</h3>
              <p>{{ safety.description }}</p>
              <div class="safety-features" v-if="safety.features">
                <ul>
                  <li v-for="feature in parseFeatures(safety.features)" :key="feature">{{ feature }}</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 医疗设施 -->
    <section class="medical-facilities" v-if="medicalFacilities.length > 0">
      <div class="container">
        <div class="section-header">
          <h2>医疗设施</h2>
          <p>专业医疗设备，保障老人健康</p>
        </div>
        <div class="medical-grid">
          <div class="medical-item" v-for="medical in medicalFacilities" :key="medical.facilityId">
            <div class="medical-image">
              <img :src="getImageUrl(medical.imageUrl)" :alt="medical.facilityName">
            </div>
            <div class="medical-info">
              <h3>{{ medical.facilityName }}</h3>
              <p>{{ medical.description }}</p>
              <div class="medical-features" v-if="medical.features">
                <div class="feature-item" v-for="feature in parseFeatures(medical.features)" :key="feature">
                  <i class="el-icon-check"></i>
                  <span>{{ feature }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 环境特色 -->
    <section class="environment-features">
      <div class="container">
        <div class="section-header">
          <h2>环境特色</h2>
          <p>绿色环保，宜居宜养</p>
        </div>
        <div class="features-grid">
          <div class="feature-item" v-for="feature in environmentFeatures" :key="feature.featureId">
            <div class="feature-icon">
              <i :class="feature.featureIcon"></i>
            </div>
            <div class="feature-content">
              <h3>{{ feature.featureName }}</h3>
              <p>{{ feature.featureDescription }}</p>
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
import { listFacilitiesPublicByType } from '@/api/website/facilities'
import { listEnvironmentFeaturesPublic } from '@/api/website/environment-features'

export default {
  name: 'FacilitiesPage',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '设施环境 - 智慧养老院'
  },
  data() {
    return {
      loading: false,
      roomTypes: [],
      publicFacilities: [],
      safetyFacilities: [],
      medicalFacilities: [],
      environmentFeatures: []
    }
  },
  computed: {
  },
  created() {
    this.loadData()
  },
  methods: {
    async loadData() {
      this.loading = true
      try {
        // 加载各类设施数据
        await Promise.all([
          this.loadFacilitiesByType('room'),
          this.loadFacilitiesByType('public'),
          this.loadFacilitiesByType('safety'),
          this.loadFacilitiesByType('medical'),
          this.loadEnvironmentFeatures()
        ])
      } catch (error) {
        console.error('加载设施数据失败:', error)
        this.$message.warning('加载设施数据失败，使用默认数据')
      } finally {
        this.loading = false
      }
    },
    
    async loadFacilitiesByType(type) {
      try {
        const response = await listFacilitiesPublicByType(type)
        const facilities = response.data || []
        
        // 添加调试信息
        console.log(`加载${type}设施数据:`, facilities)
        
        switch (type) {
          case 'room':
            this.roomTypes = facilities
            break
          case 'public':
            this.publicFacilities = facilities
            break
          case 'safety':
            this.safetyFacilities = facilities
            break
          case 'medical':
            this.medicalFacilities = facilities
            break
        }
      } catch (error) {
        console.warn(`获取${type}设施数据失败:`, error)
      }
    },
    
    // 加载环境特色数据
    async loadEnvironmentFeatures() {
      try {
        const response = await listEnvironmentFeaturesPublic()
        this.environmentFeatures = response.data || []
      } catch (error) {
        console.warn('获取环境特色数据失败:', error)
        this.environmentFeatures = []
      }
    },
    
    // 通用图片处理方法
    parseImageUrls(imageData) {
      if (!imageData) return []
      
      // 如果是数组，直接返回
      if (Array.isArray(imageData)) {
        return imageData.filter(url => url && url.trim())
      }
      
      // 如果是字符串
      if (typeof imageData === 'string') {
        try {
          // 尝试解析JSON
          const parsed = JSON.parse(imageData)
          if (Array.isArray(parsed)) {
            return parsed.filter(url => url && url.trim())
          }
        } catch (e) {
          // 如果不是JSON，按逗号分隔
          return imageData.split(',').map(url => url.trim()).filter(url => url)
        }
      }
      
      return []
    },
    
    getRoomImages(room) {
      // 优先使用关联的图片表
      if (room.facilityImages && room.facilityImages.length > 0) {
        console.log('使用关联图片表:', room.facilityImages)
        return room.facilityImages.map(img => img.imageUrl)
      }
      
      // 处理主图片字段
      if (room.imageUrl) {
        console.log('处理主图片字段:', room.imageUrl)
        const images = this.parseImageUrls(room.imageUrl)
        if (images.length > 0) {
          console.log('解析图片结果:', images)
          return images
        }
      }
      
      console.log('没有找到图片')
      return []
    },
    
    // 获取图片URL，添加错误处理
    getImageUrl(imageUrl) {
      if (!imageUrl) return ''
      
      // 处理相对路径
      if (imageUrl.startsWith('http')) {
        return imageUrl
      }
      
      // 处理绝对路径
      if (imageUrl.startsWith('/')) {
        return `${process.env.VUE_APP_BASE_API || 'http://localhost:8080'}${imageUrl}`
      }
      
      // 处理相对路径
      return `${process.env.VUE_APP_BASE_API || 'http://localhost:8080'}/${imageUrl}`
    },
    
    parseFeatures(featuresStr) {
      if (!featuresStr) return []
      try {
        // 尝试解析JSON格式
        return JSON.parse(featuresStr)
      } catch (e) {
        // 如果不是JSON，按逗号分隔
        return featuresStr.split(',').map(item => item.trim()).filter(item => item)
      }
    },
    
    getRoomTypeLabel(roomType) {
      const typeMap = {
        'single': '单人间',
        'double': '双人间',
        'triple': '三人间',
        'quad': '四人间',
        'luxury': '豪华间'
      }
      return typeMap[roomType] || roomType
    },
    
    getRoomTypeTagType(roomType) {
      const typeMap = {
        'single': 'primary',
        'double': 'success',
        'triple': 'warning',
        'quad': 'info',
        'luxury': 'danger'
      }
      return typeMap[roomType] || 'primary'
    },
    
    getOrientationLabel(orientation) {
      const orientationMap = {
        'south': '南向',
        'north': '北向',
        'east': '东向',
        'west': '西向',
        'southeast': '东南',
        'southwest': '西南',
        'northeast': '东北',
        'northwest': '西北'
      }
      return orientationMap[orientation] || orientation
    },
    
    // 处理图片加载错误
    handleImageError(event) {
      console.warn('图片加载失败:', event.target.style.backgroundImage)
      event.target.style.backgroundImage = 'none'
      event.target.style.backgroundColor = '#f5f5f5'
      event.target.innerHTML = '<i class="el-icon-picture-outline" style="font-size: 48px; color: #ccc;"></i>'
    }
  }
}
</script>

<style lang="scss" scoped>
.facilities-page {
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

// 环境概览
.facilities-overview {
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

      .facility-stats {
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

// 房间设施
.room-facilities {
  padding: 60px 0;
  background: #f8f9fa;

  .room-types {
      display: grid;
    grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
    gap: 30px;

    .room-type {
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
      transition: transform 0.3s, box-shadow 0.3s;

      &:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      }

      .room-gallery {
        .carousel-item {
          height: 200px;
          background-size: cover;
          background-position: center;
        }
        
        .no-image-placeholder {
          height: 200px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          background-color: #f5f5f5;
          color: #999;
          
          i {
            font-size: 48px;
            margin-bottom: 10px;
          }
          
          p {
            margin: 0;
            font-size: 14px;
          }
        }
      }

      .room-info {
        padding: 20px;

        .room-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 10px;

        h3 {
          color: #2c3e50;
            margin: 0;
            font-size: 20px;
            font-weight: 600;
            flex: 1;
          }

          .room-type-badge {
            margin-left: 10px;
          }
        }

        .room-description {
          color: #7f8c8d;
          line-height: 1.5;
          margin-bottom: 15px;
          font-size: 14px;
          display: -webkit-box;
          -webkit-line-clamp: 2;
          line-clamp: 2;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }

        .room-features {
          margin-bottom: 15px;

          .feature-item {
            display: inline-flex;
            align-items: center;
            margin-right: 15px;
            margin-bottom: 8px;
            font-size: 13px;

            i {
              color: #27ae60;
              margin-right: 5px;
              font-size: 12px;
            }

            span {
              color: #5a6c7d;
            }
          }
        }

        .room-details {
          .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;

            &:last-child {
              margin-bottom: 0;
            }
          }

          .detail-item {
            text-align: center;
            flex: 1;
            padding: 8px 5px;
            background: #f8f9fa;
            border-radius: 4px;
            margin: 0 2px;

            .detail-label {
              color: #7f8c8d;
              font-size: 11px;
              display: block;
              margin-bottom: 3px;
            }

            .detail-value {
              color: #2c3e50;
              font-weight: 600;
              font-size: 13px;

              &.price {
                color: #e74c3c;
                font-weight: bold;
                font-size: 14px;
              }
            }
          }
        }
      }
    }
  }
}

// 公共设施
.public-facilities {
  padding: 80px 0;
  background: white;

  .facilities-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;

    .facility-item {
      position: relative;
      border-radius: 10px;
      overflow: hidden;
      height: 300px;

      .facility-image {
        position: relative;
        height: 100%;

        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          transition: transform 0.3s;
        }

        .facility-overlay {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
          color: white;
          padding: 30px 20px 20px;
          transform: translateY(100%);
          transition: transform 0.3s;

          h3 {
            margin: 0 0 10px;
            font-size: 20px;
          }

          p {
            margin: 0 0 15px;
            opacity: 0.9;
          }

          .facility-features {
            .el-tag {
              margin: 2px;
            }
          }
        }
      }

      &:hover {
        .facility-image img {
          transform: scale(1.1);
        }

        .facility-overlay {
          transform: translateY(0);
        }
      }
    }
  }
}

// 安全设施
.safety-facilities {
  padding: 80px 0;
  background: #f8f9fa;

  .safety-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;

    .safety-item {
      display: flex;
      align-items: flex-start;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .safety-icon {
        font-size: 48px;
        color: #e74c3c;
        margin-right: 20px;
        margin-top: 5px;
      }

      .safety-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 15px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 20px;
        }

        .safety-features {
          ul {
            list-style: none;
            padding: 0;

            li {
              padding: 5px 0;
              color: #5a6c7d;
              position: relative;
              padding-left: 20px;

              &:before {
                content: '•';
                color: #e74c3c;
                position: absolute;
                left: 0;
              }
            }
          }
        }
      }
    }
  }
}

// 医疗设施
.medical-facilities {
  padding: 80px 0;
  background: white;

  .medical-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;

    .medical-item {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      background: #f8f9fa;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .medical-image {
        img {
          width: 100%;
          height: 200px;
          object-fit: cover;
        }
      }

      .medical-info {
        padding: 20px;

        h3 {
          color: #2c3e50;
          margin-bottom: 15px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin-bottom: 20px;
        }

        .medical-features {
          .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 8px;

            i {
              color: #27ae60;
              margin-right: 8px;
            }

            span {
              color: #5a6c7d;
              font-size: 14px;
            }
          }
        }
      }
    }
  }
}

// 环境特色
.environment-features {
  padding: 80px 0;
  background: #f8f9fa;

  .features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;

    .feature-item {
      display: flex;
      align-items: center;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .feature-icon {
        font-size: 48px;
        color: #27ae60;
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
}



// 响应式设计
@media (max-width: 768px) {
  .overview-content {
    grid-template-columns: 1fr !important;
    gap: 40px !important;
  }

  .room-types {
    grid-template-columns: 1fr !important;
    gap: 20px !important;
  }

  .room-type {
    .room-info {
      padding: 15px !important;
      
      .room-header {
        flex-direction: column !important;
        align-items: flex-start !important;
        
        h3 {
          font-size: 18px !important;
          margin-bottom: 8px !important;
        }
        
        .room-type-badge {
          margin-left: 0 !important;
        }
      }
      
      .room-description {
        font-size: 13px !important;
      }
      
      .room-features .feature-item {
        font-size: 12px !important;
        margin-right: 10px !important;
      }
      
      .room-details {
        .detail-row {
          flex-direction: column !important;
          gap: 8px !important;
        }
        
        .detail-item {
          margin: 0 !important;
          
          .detail-label {
            font-size: 11px !important;
          }
          
          .detail-value {
            font-size: 13px !important;
            
            &.price {
              font-size: 14px !important;
        }
      }
    }
  }
}
  }

  .medical-item {
    grid-template-columns: 1fr !important;
  }

  .facility-stats,
  .contact-stats {
    justify-content: center;
  }

  .facilities-grid {
    grid-template-columns: 1fr !important;
  }

  .safety-grid {
    grid-template-columns: 1fr !important;
  }

  .features-grid {
    grid-template-columns: 1fr !important;
  }
}
</style>
