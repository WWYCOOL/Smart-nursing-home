<template>
  <div class="news-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />

    <!-- 新闻分类导航 -->
    <section class="news-nav">
      <div class="container">
        <div class="nav-tabs">
          <div 
            class="nav-tab" 
            :class="{ active: currentCategory === '' }"
            @click="changeCategory('')">
            全部
          </div>
          <div 
            class="nav-tab" 
            :class="{ active: currentCategory === 'nursing-home' }"
            @click="changeCategory('nursing-home')">
            养老院新闻
          </div>
          <div 
            class="nav-tab" 
            :class="{ active: currentCategory === 'health' }"
            @click="changeCategory('health')">
            健康资讯
          </div>
          <div 
            class="nav-tab" 
            :class="{ active: currentCategory === 'activity' }"
            @click="changeCategory('activity')">
            活动通知
          </div>
          <div 
            class="nav-tab" 
            :class="{ active: currentCategory === 'policy' }"
            @click="changeCategory('policy')">
            政策解读
          </div>
        </div>
      </div>
    </section>

    <!-- 新闻内容区域 -->
    <section class="news-content">
      <div class="container">
        <!-- 头条轮播区域 -->
        <div class="featured-carousel" v-if="featuredNewsList.length > 0">
          <div class="section-title">

          </div>
          <el-carousel 
            :interval="3000" 
            arrow="hover" 
            height="400px" 
            indicator-position="outside"
            :autoplay="true"
            :loop="true"
            :pause-on-hover="true">
            <el-carousel-item v-for="news in featuredNewsList" :key="news.newsId">
              <div class="featured-carousel-item" @click="handleNewsClick(news)">
                <div class="featured-carousel-image">
                  <img :src="getImageUrl(news.imageUrl)" :alt="news.title" v-if="news.imageUrl">
                  <div class="default-image" v-else>
                    <i class="el-icon-picture"></i>
                  </div>
                  <div class="featured-badge">头条</div>
                </div>
                <div class="featured-carousel-content">
                  <div class="news-meta">
                    <span class="category">{{ getCategoryName(news.category) }}</span>
                    <span class="date">{{ formatDate(news.createTime) }}</span>
                    <span class="views"><i class="el-icon-view"></i> {{ formatViews(news.views) }}</span>
                  </div>
                  <h2 class="featured-title">{{ news.title }}</h2>
                  <p class="featured-summary">{{ news.summary }}</p>
                </div>
              </div>
            </el-carousel-item>
          </el-carousel>
        </div>

        <div class="news-layout" v-loading="loading">
          <!-- 左侧：新闻列表 -->
          <div class="left-column">
            <!-- 新闻列表 -->
            <div class="news-list">
              <div class="news-item" v-for="news in normalNewsList" :key="news.newsId">
                <div class="news-image">
                  <img :src="getImageUrl(news.imageUrl)" :alt="news.title" v-if="news.imageUrl">
                  <div class="default-image" v-else>
                    <i class="el-icon-picture"></i>
                  </div>
                </div>
                <div class="news-content">
                <div class="news-meta">
                  <span class="category">{{ getCategoryName(news.category) }}</span>
                  <span class="date">{{ formatDate(news.createTime) }}</span>
                  <span class="views"><i class="el-icon-view"></i> {{ formatViews(news.views) }}</span>
                </div>
                  <h3 class="news-title" @click="handleNewsClick(news)">{{ news.title }}</h3>
                  <p class="news-summary">{{ news.summary }}</p>
                </div>
              </div>
            </div>
          </div>

          <!-- 右侧：热点榜 -->
          <div class="right-column">
            <div class="hot-news">
              <div class="section-title">
                <h3>热点排行</h3>
              </div>
              <div class="hot-list">
                <div class="hot-item" v-for="(news, index) in hotNewsList" :key="news.newsId" @click="handleNewsClick(news)">
                  <div class="hot-rank" :class="'rank-' + (index + 1)">{{ index + 1 }}</div>
                  <div class="hot-content">
                    <h4 class="hot-title">{{ news.title }}</h4>
                    <div class="hot-meta">
                      <span class="hot-category">{{ getCategoryName(news.category) }}</span>
                      <span class="hot-views"><i class="el-icon-view"></i> {{ formatViews(news.views) }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-news">
              <div class="section-title">
                <h3>相关推荐</h3>
              </div>
              <div class="sidebar-list">
                <div class="sidebar-item" v-for="news in newsList.slice(5, 10)" :key="news.newsId" @click="handleNewsClick(news)">
                  <div class="sidebar-image">
                    <img :src="getImageUrl(news.imageUrl)" :alt="news.title" v-if="news.imageUrl">
                    <div class="default-image" v-else>
                      <i class="el-icon-picture"></i>
                    </div>
                  </div>
                  <div class="sidebar-content">
                    <h4 class="sidebar-title">{{ news.title }}</h4>
                    <div class="sidebar-meta">
                      <span class="sidebar-date">{{ formatDate(news.createTime) }}</span>
                      <span class="sidebar-views"><i class="el-icon-view"></i> {{ formatViews(news.views) }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- 空状态 -->
        <div class="empty-state" v-if="!loading && newsList.length === 0">
          <i class="el-icon-document"></i>
          <h3>暂无新闻动态</h3>
          <p>当前分类下暂无新闻内容，请选择其他分类或稍后再来查看。</p>
        </div>

        <!-- 分页 -->
        <div class="pagination-wrapper" v-if="newsList.length > 0">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="queryParams.pageNum"
            :page-sizes="[6, 12, 24]"
            :page-size="queryParams.pageSize"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total">
          </el-pagination>
        </div>
      </div>
    </section>

    <!-- 新闻详情弹窗 -->
    <el-dialog
      :title="selectedNews ? selectedNews.title : '新闻详情'"
      :visible.sync="dialogVisible"
      width="70%"
      :before-close="handleClose"
      class="news-dialog">
      <div class="news-detail" v-if="selectedNews">
        <div class="news-detail-meta">
          <span class="category-tag">{{ getCategoryName(selectedNews.category) }}</span>
          <span class="publish-date">
            <i class="el-icon-time"></i>
            {{ formatDate(selectedNews.createTime) }}
          </span>
        </div>
        <div class="news-detail-image" v-if="selectedNews.imageUrl">
          <img :src="getImageUrl(selectedNews.imageUrl)" :alt="selectedNews.title">
        </div>
        <div class="news-detail-content" v-html="selectedNews.content"></div>
      </div>
    </el-dialog>

    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import WebsiteNavbar from '@/components/WebsiteNavbar'
import BackToTop from '@/components/BackToTop'
import { listNewsPublic, incrementNewsViews } from '@/api/website/news'

export default {
  name: 'News',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '新闻动态 - 智慧养老院'
  },
  data() {
    return {
      loading: false,
      newsList: [],
      total: 0,
      currentCategory: '', // 当前选中的分类
      queryParams: {
        pageNum: 1,
        pageSize: 6,
        status: '0' // 只查询正常状态的新闻
      },
      dialogVisible: false,
      selectedNews: null
    }
  },
  computed: {
    // 头条新闻列表（isFeatured = 'Y'）
    featuredNewsList() {
      return this.newsList.filter(news => news.isFeatured === 'Y')
    },
    // 普通新闻列表（isFeatured = 'N' 或 null）
    normalNewsList() {
      return this.newsList.filter(news => news.isFeatured !== 'Y')
    },
    // 热点排行列表（按阅读量排序）
    hotNewsList() {
      return this.newsList
        .slice() // 创建副本，避免修改原数组
        .sort((a, b) => {
          const viewsA = a.views || 0
          const viewsB = b.views || 0
          return viewsB - viewsA // 降序排序，阅读量高的在前
        })
        .slice(0, 10) // 取前10条
    }
  },
  created() {
    this.getNewsList()
  },
  methods: {
    // 获取新闻列表
    getNewsList() {
      this.loading = true
      const params = { ...this.queryParams }
      if (this.currentCategory) {
        params.category = this.currentCategory
      }
      listNewsPublic(params).then(response => {
        this.newsList = response.rows || []
        this.total = response.total || 0
        this.loading = false
      }).catch((error) => {
        console.error('获取新闻数据失败:', error)
        this.loading = false
        this.newsList = []
        this.total = 0
      })
    },
    // 切换分类
    changeCategory(category) {
      this.currentCategory = category
      this.queryParams.pageNum = 1
      this.getNewsList()
    },
    // 处理新闻点击
    handleNewsClick(news) {
      // 增加阅读量
      this.incrementViews(news.newsId)
      
      this.selectedNews = news
      this.dialogVisible = true
    },
    // 增加阅读量
    async incrementViews(newsId) {
      try {
        const response = await incrementNewsViews(newsId)
        // 根据后端返回的实际阅读量更新本地显示
        this.updateLocalViews(newsId, response.data)
      } catch (error) {
        console.warn('增加阅读量失败:', error)
      }
    },
    // 更新本地阅读量显示
    updateLocalViews(newsId, actualViews) {
      const news = this.newsList.find(item => item.newsId === newsId)
      if (news) {
        // 使用后端返回的实际阅读量，而不是简单+1
        news.views = actualViews || news.views
      }
    },
    // 关闭弹窗
    handleClose() {
      this.dialogVisible = false
      this.selectedNews = null
    },
    // 分页大小改变
    handleSizeChange(val) {
      this.queryParams.pageSize = val
      this.queryParams.pageNum = 1
      this.getNewsList()
    },
    // 当前页改变
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      this.getNewsList()
    },
    // 处理图片URL
    getImageUrl(imageUrl) {
      if (!imageUrl) return ''
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        return imageUrl
      }
      return 'http://localhost:8080' + imageUrl
    },
    // 获取分类名称
    getCategoryName(category) {
      const categoryMap = {
        'nursing-home': '养老院新闻',
        'health': '健康资讯',
        'activity': '活动通知',
        'policy': '政策解读'
      }
      return categoryMap[category] || '其他'
    },
    // 格式化日期 - 显示精确到分钟
    formatDate(date) {
      if (!date) return ''
      const d = new Date(date)
      return d.getFullYear() + '-' +
             String(d.getMonth() + 1).padStart(2, '0') + '-' +
             String(d.getDate()).padStart(2, '0') + ' ' +
             String(d.getHours()).padStart(2, '0') + ':' +
             String(d.getMinutes()).padStart(2, '0')
    },
    // 格式化阅读量
    formatViews(views) {
      if (!views) return '0'
      if (views >= 10000) {
        return (views / 10000).toFixed(1) + '万'
      } else if (views >= 1000) {
        return (views / 1000).toFixed(1) + 'k'
      }
      return views.toString()
    }
  }
}
</script>

<style scoped>
.news-page {
  min-height: 100vh;
  background-color: #f5f5f5;
}

/* 新闻分类导航 */
.news-nav {
  background: white;
  border-bottom: 1px solid #e5e5e5;
  padding: 0;
}

.nav-tabs {
  display: flex;
  gap: 0;
}

.nav-tab {
  padding: 15px 20px;
  background: white;
  border-bottom: 3px solid transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  font-weight: 500;
  color: #333;
  font-size: 0.9rem;
  position: relative;
}

.nav-tab:hover {
  background: #f8f9fa;
  color: #000;
}

.nav-tab.active {
  color: #d32f2f;
  border-bottom-color: #d32f2f;
  background: #f8f9fa;
}

/* 新闻内容区域 */
.news-content {
  padding: 40px 0;
}

/* 头条轮播区域 */
.featured-carousel {
  margin-bottom: 40px;
}

.featured-carousel-item {
  display: flex;
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: transform 0.3s ease;
  height: 400px;
}

.featured-carousel-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.featured-carousel-image {
  flex: 1;
  position: relative;
  overflow: hidden;
}

.featured-carousel-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.featured-carousel-content {
  flex: 1;
  padding: 30px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.featured-carousel-content .news-meta {
  display: flex;
  align-items: center;
  gap: 15px;
  margin-bottom: 15px;
  font-size: 0.9rem;
  color: #666;
}

.featured-carousel-content .category {
  background: #d32f2f;
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 0.8rem;
}

.featured-carousel-content .date {
  color: #999;
}

.featured-carousel-content .views {
  color: #999;
  display: flex;
  align-items: center;
  gap: 3px;
}

.featured-carousel-content .views i {
  font-size: 0.8rem;
}

.featured-carousel-content .featured-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 15px;
  color: #333;
  line-height: 1.3;
}

.featured-carousel-content .featured-summary {
  color: #666;
  line-height: 1.6;
  font-size: 1.1rem;
}

.news-layout {
  display: grid;
  grid-template-columns: 1fr 300px;
  gap: 20px;
  max-width: 1200px;
  margin: 0 auto;
  margin-top: 20px;
}

/* 左侧列 */
.left-column {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* 右侧列 */
.right-column {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* 区块标题 */
.section-title {
  border-bottom: 2px solid #d32f2f;
  padding-bottom: 8px;
  margin-bottom: 15px;
}

.section-title h3 {
  font-size: 1.1rem;
  font-weight: 600;
  color: #333;
  margin: 0;
}

/* 头条新闻 */
.featured-news {
  margin-bottom: 20px;
}

.featured-item {
  background: white;
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: box-shadow 0.3s ease;
}

.featured-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.featured-image {
  position: relative;
  height: 250px;
  overflow: hidden;
}

.featured-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.featured-badge {
  position: absolute;
  top: 15px;
  left: 15px;
  background: #d32f2f;
  color: white;
  padding: 4px 8px;
  font-size: 0.75rem;
  font-weight: bold;
}

.featured-content {
  padding: 20px;
}

.featured-title {
  font-size: 1.3rem;
  font-weight: 600;
  margin-bottom: 10px;
  color: #333;
  line-height: 1.3;
}

.featured-summary {
  color: #666;
  line-height: 1.6;
  font-size: 0.9rem;
}

/* 新闻列表 */
.news-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.news-item {
  background: white;
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
  display: flex;
  min-height: 100px;
}

.news-item:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.news-image {
  width: 120px;
  height: 100px;
  position: relative;
  overflow: hidden;
  flex-shrink: 0;
}

.news-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.default-image {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f0f0f0;
  color: #999;
  font-size: 1.2rem;
}

.news-content {
  flex: 1;
  padding: 12px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.news-meta {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 6px;
  font-size: 0.75rem;
  color: #666;
}

.category {
  background: #f0f0f0;
  color: #666;
  padding: 2px 6px;
  border-radius: 2px;
  font-size: 0.7rem;
}

.date {
  color: #999;
}

.views {
  color: #999;
  display: flex;
  align-items: center;
  gap: 3px;
}

.views i {
  font-size: 0.7rem;
}

.news-title {
  font-size: 0.9rem;
  font-weight: 600;
  margin-bottom: 6px;
  color: #333;
  line-height: 1.4;
  cursor: pointer;
  transition: color 0.3s ease;
}

.news-title:hover {
  color: #d32f2f;
}

.news-summary {
  color: #666;
  line-height: 1.4;
  font-size: 0.8rem;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

/* 热点榜 */
.hot-news {
  background: white;
  border-radius: 4px;
  padding: 15px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.hot-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.hot-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 8px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.hot-item:hover {
  background: #f8f9fa;
}

.hot-rank {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.8rem;
  font-weight: bold;
  color: white;
  flex-shrink: 0;
}

.rank-1 { background: #d32f2f; }
.rank-2 { background: #ff9800; }
.rank-3 { background: #ffc107; }
.rank-4, .rank-5, .rank-6, .rank-7, .rank-8, .rank-9, .rank-10 { 
  background: #666; 
}

.hot-content {
  flex: 1;
}

.hot-title {
  font-size: 0.85rem;
  font-weight: 500;
  color: #333;
  line-height: 1.3;
  margin: 0 0 4px 0;
}

.hot-meta {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 4px;
}

.hot-category {
  font-size: 0.7rem;
  color: #999;
}

.hot-views {
  font-size: 0.7rem;
  color: #999;
  display: flex;
  align-items: center;
  gap: 3px;
}

.hot-views i {
  font-size: 0.7rem;
}

/* 侧边栏推荐 */
.sidebar-news {
  background: white;
  border-radius: 4px;
  padding: 15px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.sidebar-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.sidebar-item {
  display: flex;
  gap: 10px;
  padding: 8px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.sidebar-item:hover {
  background: #f8f9fa;
}

.sidebar-image {
  width: 60px;
  height: 60px;
  border-radius: 4px;
  overflow: hidden;
  flex-shrink: 0;
}

.sidebar-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.sidebar-content {
  flex: 1;
}

.sidebar-title {
  font-size: 0.8rem;
  font-weight: 500;
  color: #333;
  line-height: 1.3;
  margin: 0 0 4px 0;
}

.sidebar-meta {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 4px;
}

.sidebar-date {
  font-size: 0.7rem;
  color: #999;
}

.sidebar-views {
  font-size: 0.7rem;
  color: #999;
  display: flex;
  align-items: center;
  gap: 3px;
}

.sidebar-views i {
  font-size: 0.7rem;
}

/* 空状态 */
.empty-state {
  text-align: center;
  padding: 80px 0;
  color: #999;
}

.empty-state i {
  font-size: 3rem;
  margin-bottom: 15px;
  display: block;
  color: #ddd;
}

.empty-state h3 {
  font-size: 1.3rem;
  margin-bottom: 8px;
  color: #666;
}

.empty-state p {
  font-size: 0.9rem;
  line-height: 1.6;
}

/* 分页 */
.pagination-wrapper {
  display: flex;
  justify-content: center;
  margin-top: 40px;
}

/* 新闻详情弹窗 */
.news-dialog >>> .el-dialog__header {
  padding: 20px 20px 10px;
  border-bottom: 1px solid #eee;
}

.news-dialog >>> .el-dialog__body {
  padding: 20px;
}

.news-detail-meta {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 1px solid #eee;
  font-size: 0.9rem;
  color: #666;
}

.category-tag {
  background: #f0f0f0;
  color: #666;
  padding: 4px 8px;
  border-radius: 2px;
  font-size: 0.8rem;
}

.news-detail-image {
  margin-bottom: 20px;
  text-align: center;
}

.news-detail-image img {
  max-width: 100%;
  border-radius: 4px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.news-detail-content {
  line-height: 1.8;
  color: #333;
  font-size: 1rem;
  margin-bottom: 20px;
}

.news-detail-content p {
  margin-bottom: 15px;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .featured-carousel-item {
    flex-direction: column;
    height: auto;
  }
  
  .featured-carousel-image {
    height: 200px;
  }
  
  .featured-carousel-content {
    padding: 20px;
  }
  
  .featured-carousel-content .featured-title {
    font-size: 1.5rem;
  }
  
  .news-layout {
    grid-template-columns: 1fr;
    gap: 15px;
  }
  
  .right-column {
    display: flex;
    flex-direction: column;
  }
  
  .nav-tabs {
    flex-wrap: wrap;
  }
  
  .nav-tab {
    padding: 12px 16px;
    font-size: 0.8rem;
  }
  
  .featured-image {
    height: 200px;
  }
  
  .featured-title {
    font-size: 1.2rem;
  }
  
  .news-item {
    flex-direction: column;
  }
  
  .news-image {
    width: 100%;
    height: 150px;
  }
  
  .news-content {
    padding: 15px;
  }
  
  .hot-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 8px;
  }
  
  .hot-rank {
    align-self: flex-start;
  }
}
</style>