import request from '@/utils/request'

// 查询新闻列表
export function listNews(query) {
  return request({
    url: '/website/news/list',
    method: 'get',
    params: query
  })
}

// 公开查询新闻列表（无需权限）
export function listNewsPublic(query) {
  return request({
    url: '/website/news/public/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询新闻详细
export function getNews(newsId) {
  return request({
    url: '/website/news/' + newsId,
    method: 'get'
  })
}

// 新增新闻
export function addNews(data) {
  return request({
    url: '/website/news',
    method: 'post',
    data: data
  })
}

// 修改新闻
export function updateNews(data) {
  return request({
    url: '/website/news',
    method: 'put',
    data: data
  })
}

// 删除新闻
export function delNews(newsId) {
  return request({
    url: '/website/news/' + newsId,
    method: 'delete'
  })
}

// 增加新闻阅读量（公开接口，无需权限）
export function incrementNewsViews(newsId) {
  return request({
    url: '/website/news/views/' + newsId,
    method: 'post',
    headers: {
      isToken: false
    }
  })
}

// 获取新闻阅读量（公开接口，无需权限）
export function getNewsViews(newsId) {
  return request({
    url: '/website/news/views/' + newsId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}

