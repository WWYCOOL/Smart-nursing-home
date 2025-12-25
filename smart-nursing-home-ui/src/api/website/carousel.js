import request from '@/utils/request'

// 查询轮播图列表
export function listCarousel(query) {
  return request({
    url: '/website/carousel/list',
    method: 'get',
    params: query
  })
}

// 公开查询轮播图列表（无需权限）
export function listCarouselPublic(query) {
  return request({
    url: '/website/carousel/public/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询轮播图详细
export function getCarousel(carouselId) {
  return request({
    url: '/website/carousel/' + carouselId,
    method: 'get'
  })
}

// 新增轮播图
export function addCarousel(data) {
  return request({
    url: '/website/carousel',
    method: 'post',
    data: data
  })
}

// 修改轮播图
export function updateCarousel(data) {
  return request({
    url: '/website/carousel',
    method: 'put',
    data: data
  })
}

// 删除轮播图
export function delCarousel(carouselId) {
  return request({
    url: '/website/carousel/' + carouselId,
    method: 'delete'
  })
}

