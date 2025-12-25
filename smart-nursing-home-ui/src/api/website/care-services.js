import request from '@/utils/request'

// 查询生活照料服务列表
export function listCareServices(query) {
  return request({
    url: '/website/care-services/list',
    method: 'get',
    params: query
  })
}

// 查询生活照料服务详细
export function getCareServices(serviceId) {
  return request({
    url: '/website/care-services/' + serviceId,
    method: 'get'
  })
}

// 新增生活照料服务
export function addCareServices(data) {
  return request({
    url: '/website/care-services',
    method: 'post',
    data: data
  })
}

// 修改生活照料服务
export function updateCareServices(data) {
  return request({
    url: '/website/care-services',
    method: 'put',
    data: data
  })
}

// 删除生活照料服务
export function delCareServices(serviceId) {
  return request({
    url: '/website/care-services/' + serviceId,
    method: 'delete'
  })
}

// 获取生活照料服务列表（公开接口）
export function listCareServicesPublic() {
  return request({
    url: '/website/care-services/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}








