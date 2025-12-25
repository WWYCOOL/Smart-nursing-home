import request from '@/utils/request'

// 查询医疗护理服务列表
export function listMedicalServices(query) {
  return request({
    url: '/website/medical-services/list',
    method: 'get',
    params: query
  })
}

// 查询医疗护理服务详细
export function getMedicalServices(serviceId) {
  return request({
    url: '/website/medical-services/' + serviceId,
    method: 'get'
  })
}

// 新增医疗护理服务
export function addMedicalServices(data) {
  return request({
    url: '/website/medical-services',
    method: 'post',
    data: data
  })
}

// 修改医疗护理服务
export function updateMedicalServices(data) {
  return request({
    url: '/website/medical-services',
    method: 'put',
    data: data
  })
}

// 删除医疗护理服务
export function delMedicalServices(serviceId) {
  return request({
    url: '/website/medical-services/' + serviceId,
    method: 'delete'
  })
}

// 获取医疗护理服务列表（公开接口）
export function listMedicalServicesPublic() {
  return request({
    url: '/website/medical-services/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}








