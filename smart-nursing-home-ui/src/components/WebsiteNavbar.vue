<template>
  <header class="website-navbar">
    <div class="container">
      <div class="logo" @click="$router.push('/website/home')">
        <h1>智慧养老院</h1>
        <p>让爱陪伴每一天</p>
      </div>
      <nav class="nav">
        <ul>
          <li><a :class="{ active: $route.path === '/website/home' }" @click="$router.push('/website/home')">首页</a></li>
          <li><a :class="{ active: $route.path === '/website/about' }" @click="$router.push('/website/about')">关于我们</a></li>
          <li><a :class="{ active: $route.path === '/website/services' }" @click="$router.push('/website/services')">服务项目</a></li>
          <li><a :class="{ active: $route.path === '/website/facilities-display' }" @click="$router.push('/website/facilities-display')">设施环境</a></li>
          <li><a :class="{ active: $route.path === '/website/news-display' }" @click="$router.push('/website/news-display')">新闻动态</a></li>
          <li><a :class="{ active: $route.path === '/website/contact' }" @click="$router.push('/website/contact')">联系我们</a></li>
        </ul>
      </nav>
      <div class="header-actions">
        <el-button type="primary" @click="$router.push('/website/appointment-visit')">在线预约</el-button>
        <el-button @click="$router.push('/website/family-login')">家属登录</el-button>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'WebsiteNavbar'
}
</script>

<style lang="scss" scoped>
.website-navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  z-index: 1000;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 80px;
  }

  .logo {
    cursor: pointer;
    
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
        cursor: pointer;

        &:hover, &.active {
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

// 响应式设计
@media (max-width: 768px) {
  .website-navbar .container {
    flex-direction: column;
    height: auto;
    padding: 20px;
  }

  .website-navbar .nav {
    margin: 20px 0;
  }

  .website-navbar .nav ul {
    flex-direction: column;
    text-align: center;
  }
}
</style>

