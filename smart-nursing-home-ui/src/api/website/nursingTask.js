import request from '@/utils/request'

// 查询护理任务列表
export function listNursingTask(query) {
  return request({
    url: '/website/nursingTask/list',
    method: 'get',
    params: query
  })
}

// 查询护理任务详细
export function getNursingTask(taskId) {
  return request({
    url: '/website/nursingTask/' + taskId,
    method: 'get'
  })
}

// 新增护理任务
export function addNursingTask(data) {
  return request({
    url: '/website/nursingTask',
    method: 'post',
    data: data
  })
}

// 修改护理任务
export function updateNursingTask(data) {
  return request({
    url: '/website/nursingTask',
    method: 'put',
    data: data
  })
}

// 删除护理任务
export function delNursingTask(taskId) {
  return request({
    url: '/website/nursingTask/' + taskId,
    method: 'delete'
  })
}
