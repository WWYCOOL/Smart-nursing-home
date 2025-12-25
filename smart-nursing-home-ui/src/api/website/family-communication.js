import request from '@/utils/request'

// 查询家属沟通记录列表
export function listFamilyCommunication(query) {
  return request({
    url: '/website/communication/family/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 发送消息
export function sendMessage(data) {
  return request({
    url: '/website/communication/family/send',
    method: 'post',
    data: data,
    headers: {
      isToken: false
    }
  })
}

// 标记消息为已读
export function markAsRead(messageId) {
  return request({
    url: '/website/communication/family/read/' + messageId,
    method: 'put',
    headers: {
      isToken: false
    }
  })
}

// 获取未读消息数量
export function getUnreadCount(familyId) {
  return request({
    url: '/website/communication/family/unread/' + familyId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}
