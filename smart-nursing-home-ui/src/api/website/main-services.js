import request from '@/utils/request'

// 查询主要服务项目列表
export function listMainServices(query) {
  return request({
    url: '/website/main-services/list',
    method: 'get',
    params: query
  })
}

// 查询主要服务项目详细
export function getMainServices(serviceId) {
  return request({
    url: '/website/main-services/' + serviceId,
    method: 'get'
  })
}

// 新增主要服务项目
export function addMainServices(data) {
  return request({
    url: '/website/main-services',
    method: 'post',
    data: data
  })
}

// 修改主要服务项目
export function updateMainServices(data) {
  return request({
    url: '/website/main-services',
    method: 'put',
    data: data
  })
}

// 删除主要服务项目
export function delMainServices(serviceId) {
  return request({
    url: '/website/main-services/' + serviceId,
    method: 'delete'
  })
}

// 获取主要服务项目列表（公开接口）
export function listMainServicesPublic() {
  return request({
    url: '/website/main-services/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}








