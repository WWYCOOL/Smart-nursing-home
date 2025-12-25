// 家属专用路由配置
export const familyRoutes = [
  {
    path: '/family/dashboard',
    component: () => import('@/views/family/dashboard/index'),
    meta: { 
      title: '家属首页',
      hidden: true // 不在侧边栏显示，但可以访问
    }
  },
  {
    path: '/family/elderly',
    component: () => import('@/views/family/elderly/index'),
    meta: { 
      title: '老人信息',
      hidden: true // 不在侧边栏显示，但可以访问
    }
  },
  {
    path: '/family/health',
    component: () => import('@/views/family/health/index'),
    meta: {
      title: '健康报告',
      hidden: true // 不在侧边栏显示，但可以访问
    }
  },
  {
    path: '/family/communication',
    component: () => import('@/views/family/communication/index'),
    meta: {
      title: '在线沟通',
      hidden: true // 不在侧边栏显示，但可以访问
    }
  },
  {
    path: '/family/fee',
    component: () => import('@/views/family/fee/index'),
    meta: {
      title: '费用查询',
      hidden: true // 不在侧边栏显示，但可以访问
    }
  },
  {
    path: '/family/care',
    component: () => import('@/views/family/care/index'),
    meta: {
      title: '护理项目',
      hidden: true
    }
  }
]
