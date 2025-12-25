import request from '@/utils/request'

// 查询设施管理列表
export function listFacilities(query) {
  return request({
    url: '/website/facilities/list',
    method: 'get',
    params: query
  })
}

// 查询设施管理详细
export function getFacilities(facilityId) {
  return request({
    url: '/website/facilities/' + facilityId,
    method: 'get'
  })
}

// 新增设施管理
export function addFacilities(data) {
  return request({
    url: '/website/facilities',
    method: 'post',
    data: data
  })
}

// 修改设施管理
export function updateFacilities(data) {
  return request({
    url: '/website/facilities',
    method: 'put',
    data: data
  })
}

// 删除设施管理
export function delFacilities(facilityId) {
  return request({
    url: '/website/facilities/' + facilityId,
    method: 'delete'
  })
}

// 根据设施类型查询设施列表（公开接口）
export function listFacilitiesPublicByType(facilityType) {
  return request({
    url: '/website/facilities/public/list/' + facilityType,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}

// 查询所有设施列表（公开接口）
export function listFacilitiesPublic() {
  return request({
    url: '/website/facilities/public/list',
    method: 'get',
    headers: {
      isToken: false
    }
  })
}











