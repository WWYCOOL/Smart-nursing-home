import request from '@/utils/request'

// 查询家属老人关系列表
export function listFamilyElderlyRelation(query) {
  return request({
    url: '/website/relation/list',
    method: 'get',
    params: query
  })
}

// 查询家属老人关系详细
export function getFamilyElderlyRelation(relationId) {
  return request({
    url: '/website/relation/' + relationId,
    method: 'get'
  })
}

// 新增家属老人关系
export function addFamilyElderlyRelation(data) {
  return request({
    url: '/website/relation',
    method: 'post',
    data: data
  })
}

// 修改家属老人关系
export function updateFamilyElderlyRelation(data) {
  return request({
    url: '/website/relation',
    method: 'put',
    data: data
  })
}

// 删除家属老人关系
export function delFamilyElderlyRelation(relationId) {
  return request({
    url: '/website/relation/' + relationId,
    method: 'delete'
  })
}

// 审核家属老人关系
export function auditFamilyElderlyRelation(data) {
  return request({
    url: '/website/relation/audit',
    method: 'post',
    params: data
  })
}

// 根据家属ID查询绑定的老人列表
export function getElderlyListByFamilyId(familyId) {
  return request({
    url: '/website/relation/elderly/' + familyId,
    method: 'get'
  })
}

// 根据老人ID查询绑定的家属列表
export function getFamilyListByElderlyId(elderlyId) {
  return request({
    url: '/website/relation/family/' + elderlyId,
    method: 'get'
  })
}
