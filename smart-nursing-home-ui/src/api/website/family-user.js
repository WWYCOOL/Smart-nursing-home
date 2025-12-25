import request from '@/utils/request'

// 查询家属用户列表
export function listFamilyUser(query) {
  return request({
    url: '/website/family/list',
    method: 'get',
    params: query
  })
}

// 查询家属用户详细
export function getFamilyUser(familyId) {
  return request({
    url: '/website/family/' + familyId,
    method: 'get'
  })
}

// 新增家属用户
export function addFamilyUser(data) {
  return request({
    url: '/website/family',
    method: 'post',
    data: data
  })
}

// 修改家属用户
export function updateFamilyUser(data) {
  return request({
    url: '/website/family',
    method: 'put',
    data: data
  })
}

// 删除家属用户
export function delFamilyUser(familyId) {
  return request({
    url: '/website/family/' + familyId,
    method: 'delete'
  })
}

// 家属用户注册
export function registerFamilyUser(data) {
  return request({
    url: '/website/family/register',
    method: 'post',
    data: data,
    headers: {
      isToken: false
    }
  })
}

// 家属用户登录
export function loginFamilyUser(data) {
  return request({
    url: '/website/family/login',
    method: 'post',
    data: data
  })
}

// 根据老人身份证号查询老人信息
export function getElderlyByIdCard(idCard) {
  return request({
    url: '/website/relation/elderly/info',
    method: 'get',
    params: { idCard: idCard },
    headers: {
      isToken: false
    }
  })
}

// 创建家属老人绑定关系
export function createFamilyElderlyRelation(data) {
  return request({
    url: '/website/relation/create',
    method: 'post',
    data: data,
    headers: {
      isToken: false,
      'Content-Type': 'application/json'
    }
  })
}

// 根据家属ID获取绑定的老人列表
export function getElderlyListByFamilyId(familyId) {
  return request({
    url: '/website/relation/elderly/' + familyId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}

// 获取家属的最新活动记录
export function getFamilyRecentActivities(familyId) {
  return request({
    url: '/website/family/activities/' + familyId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}
