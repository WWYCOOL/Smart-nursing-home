<template>
  <div class="family-communication">
    <!-- 页面标题 -->
    <div class="page-header">
      <h1>在线沟通</h1>
      <el-button type="primary" @click="goToDashboard">返回首页</el-button>
    </div>

    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <div class="loading-content">
        <i class="el-icon-loading"></i>
        <p>加载中...</p>
      </div>
    </div>

    <!-- 沟通界面 -->
    <div class="communication-container" v-if="!loading">
      <!-- 聊天区域 -->
      <div class="chat-area">
        <div class="chat-header">
          <div class="chat-info">
            <h3>与护理人员沟通</h3>
            <p>老人：{{ elderlyInfo ? elderlyInfo.elderlyName : '未知' }}</p>
          </div>
          <div class="chat-status">
            <el-tag :type="onlineStatus ? 'success' : 'info'">
              {{ onlineStatus ? '在线' : '离线' }}
            </el-tag>
          </div>
        </div>

        <!-- 消息列表 -->
        <div class="message-list" ref="messageList">
          <div 
            v-for="message in messageList" 
            :key="message.messageId"
            :class="['message-item', message.senderType === 'family' ? 'message-sent' : 'message-received']"
          >
            <div class="message-avatar">
              <i :class="message.senderType === 'family' ? 'el-icon-user' : 'el-icon-user-solid'"></i>
            </div>
            <div class="message-content">
              <div class="message-header">
                <span class="sender-name">{{ getSenderName(message) }}</span>
                <span class="message-time">{{ formatTime(message.sendTime) }}</span>
              </div>
              <div class="message-text">{{ message.content }}</div>
              <div class="message-status" v-if="message.senderType === 'family'">
                <i :class="message.isRead ? 'el-icon-check' : 'el-icon-time'"></i>
                <span>{{ message.isRead ? '已读' : '未读' }}</span>
              </div>
            </div>
          </div>
          
          <!-- 空状态 -->
          <div v-if="messageList.length === 0" class="empty-messages">
            <i class="el-icon-chat-dot-round"></i>
            <p>暂无消息记录</p>
            <p class="empty-tip">开始与护理人员沟通吧！</p>
          </div>
        </div>

        <!-- 输入区域 -->
        <div class="input-area">
          <div class="input-container">
            <el-input
              v-model="newMessage"
              type="textarea"
              :rows="3"
              placeholder="请输入您想咨询的问题..."
              @keyup.ctrl.enter="sendMessage"
              :disabled="sending"
            ></el-input>
            <div class="input-actions">
              <div class="quick-replies">
                <el-button 
                  v-for="reply in quickReplies" 
                  :key="reply"
                  size="mini" 
                  type="text"
                  @click="selectQuickReply(reply)"
                >
                  {{ reply }}
                </el-button>
              </div>
              <el-button 
                type="primary" 
                @click="sendMessage"
                :loading="sending"
                :disabled="!newMessage.trim()"
              >
                发送
              </el-button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { listFamilyCommunication, sendMessage, markAsRead, getUnreadCount } from '@/api/website/family-communication'
import { getElderlyListByFamilyId } from '@/api/website/family-user'

export default {
  name: "FamilyCommunication",
  data() {
    return {
      // 用户信息
      userInfo: {},
      elderlyInfo: null,
      
      // 消息相关
      messageList: [],
      newMessage: '',
      sending: false,
      loading: true,
      
      // 状态
      onlineStatus: true,
      todayMessageCount: 0,
      
      // 自动刷新
      refreshTimer: null,
      
      // 快捷回复
      quickReplies: [
        '老人今天状态如何？',
        '需要什么帮助吗？',
        '谢谢您的回复',
        '好的，我知道了'
      ]
    }
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
  },
  beforeDestroy() {
    // 清理定时器
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer);
    }
  },
  methods: {
    // 初始化用户信息
    initUserInfo() {
      const familyUser = JSON.parse(localStorage.getItem('family_user') || sessionStorage.getItem('family_user') || '{}');
      if (familyUser.familyId) {
        this.userInfo = familyUser;
      }
    },
    // 加载老人信息
    loadElderlyInfo() {
      if (!this.userInfo.familyId) {
        this.$message.error('用户信息不完整，请重新登录');
        this.$router.push('/website/family-login');
        return;
      }
      
      getElderlyListByFamilyId(this.userInfo.familyId).then(response => {
        if (response.code === 200 && response.data) {
          this.elderlyInfo = response.data;
          this.loadMessages();
          this.startAutoRefresh();
        } else {
          this.$message.warning('暂未绑定老人信息，请联系管理员');
        }
        this.loading = false;
      }).catch(error => {
        this.$message.error('加载老人信息失败：' + (error.message || '未知错误'));
        this.loading = false;
      });
    },
    // 加载消息列表
    loadMessages(isSilent = false) {
      listFamilyCommunication({
        familyId: this.userInfo.familyId,
        elderlyId: this.elderlyInfo.elderlyId
      }).then(response => {
        if (response.code === 200) {
          // 在更新数据前检查是否处于底部
          const messageListRef = this.$refs.messageList;
          let isAtBottom = true;
          if (messageListRef) {
            // 允许50px的误差
            isAtBottom = messageListRef.scrollHeight - messageListRef.scrollTop - messageListRef.clientHeight <= 50;
          }

          this.messageList = response.rows || [];
          this.todayMessageCount = this.getMessageCountToday();
          
          this.$nextTick(() => {
            // 如果不是静默刷新（首次加载或发送消息），或者用户原本就在底部，则滚动到底部
            if (!isSilent || isAtBottom) {
              this.scrollToBottom();
            }
          });
        }
      }).catch(error => {
        console.error('加载消息失败:', error);
      });
    },
    // 获取发送者名称
    getSenderName(message) {
      if (message.senderType === 'family') {
        return '我';
      } else {
        return message.senderName || '医护人员';
      }
    },
    // 发送消息
    sendMessage() {
      if (!this.newMessage.trim()) {
        return;
      }

      this.sending = true;
      const messageData = {
        familyId: this.userInfo.familyId,
        elderlyId: this.elderlyInfo.elderlyId,
        senderType: 'family',
        senderName: this.userInfo.familyName || '家属',
        content: this.newMessage.trim(),
        messageType: 'text',
        familyName: this.userInfo.familyName,
        elderlyName: this.elderlyInfo.elderlyName
      };

      sendMessage(messageData).then(response => {
        if (response.code === 200) {
          this.newMessage = '';
          this.loadMessages();
          this.$message.success('消息发送成功');
        } else {
          this.$message.error('消息发送失败：' + (response.msg || '未知错误'));
        }
      }).catch(error => {
        this.$message.error('消息发送失败：' + (error.message || '未知错误'));
      }).finally(() => {
        this.sending = false;
      });
    },
    // 选择快捷回复
    selectQuickReply(reply) {
      this.newMessage = reply;
    },
    // 标记消息为已读
    markMessageAsRead(messageId) {
      markAsRead(messageId).then(response => {
        if (response.code === 200) {
          // 更新本地消息状态
          this.messageList.forEach(conversation => {
            if (conversation.familyMessage && conversation.familyMessage.messageId === messageId) {
              conversation.familyMessage.isRead = '1';
            }
          });
        }
      });
    },
    // 获取今日消息数量
    getMessageCountToday() {
      const today = new Date().toDateString();
      return this.messageList.filter(conversation => {
        const messageDate = new Date(conversation.startTime).toDateString();
        return messageDate === today;
      }).length;
    },
    // 滚动到底部
    scrollToBottom() {
      this.$nextTick(() => {
        const messageList = this.$refs.messageList;
        if (messageList) {
          messageList.scrollTop = messageList.scrollHeight;
        }
      });
    },
    // 开始自动刷新
    startAutoRefresh() {
      // 清除旧的定时器（如果有）
      if (this.refreshTimer) {
        clearInterval(this.refreshTimer);
      }
      this.refreshTimer = setInterval(() => {
        this.loadMessages(true);
      }, 5000); // 每5秒刷新一次，且为静默刷新
    },
    // 格式化时间
    formatTime(time) {
      if (!time) return '';
      const date = new Date(time);
      const now = new Date();
      const diff = now - date;
      
      // 小于1分钟
      if (diff < 60000) {
        return '刚刚';
      }
      // 小于1小时
      if (diff < 3600000) {
        return Math.floor(diff / 60000) + '分钟前';
      }
      // 小于24小时
      if (diff < 86400000) {
        return Math.floor(diff / 3600000) + '小时前';
      }
      // 超过24小时，显示具体时间
      return date.toLocaleString('zh-CN', {
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
      });
    },
    // 返回首页
    goToDashboard() {
      this.$router.push('/family/dashboard');
    }
  }
};
</script>

<style scoped>
.family-communication {
  min-height: 100vh;
  background: #f5f7fa;
}

/* 页面头部 */
.page-header {
  background: white;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.page-header h1 {
  margin: 0;
  color: #303133;
  font-size: 24px;
}

/* 加载状态 */
.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 400px;
}

.loading-content {
  text-align: center;
}

.loading-content i {
  font-size: 32px;
  color: #409EFF;
  margin-bottom: 10px;
}

.loading-content p {
  margin: 0;
  color: #666;
  font-size: 14px;
}

/* 沟通容器 */
.communication-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.chat-area {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  overflow: hidden;
  display: flex;
  flex-direction: column;
  height: 600px;
}

/* 聊天头部 */
.chat-header {
  background: #409EFF;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chat-info h3 {
  margin: 0 0 5px 0;
  font-size: 18px;
}

.chat-info p {
  margin: 0;
  font-size: 14px;
  opacity: 0.9;
}

/* 消息列表样式 */
.message-list {
  flex: 1;
  padding: 20px;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.message-item {
  display: flex;
  margin-bottom: 15px;
  padding: 10px;
}

.message-sent {
  justify-content: flex-end;
}

.message-received {
  justify-content: flex-start;
}

.message-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #409EFF;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 10px;
  flex-shrink: 0;
}

.message-received .message-avatar {
  background: #67c23a;
}

.message-content {
  max-width: 70%;
  background: #f0f2f5;
  padding: 10px 15px;
  border-radius: 8px;
  position: relative;
}

.message-sent .message-content {
  background: #409EFF;
  color: white;
}

.message-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 5px;
}

.sender-name {
  font-weight: bold;
  font-size: 12px;
}

.message-time {
  font-size: 11px;
  opacity: 0.7;
}

.message-text {
  line-height: 1.4;
  word-wrap: break-word;
}

.message-status {
  display: flex;
  align-items: center;
  font-size: 11px;
  margin-top: 5px;
  opacity: 0.7;
}

.message-status i {
  margin-right: 4px;
}

/* 空状态 */
.empty-messages {
  text-align: center;
  padding: 60px 20px;
  color: #909399;
}

.empty-messages i {
  font-size: 48px;
  margin-bottom: 20px;
  display: block;
}

.empty-messages p {
  margin: 0 0 10px 0;
  font-size: 16px;
}

.empty-tip {
  font-size: 14px;
  opacity: 0.7;
}

/* 输入区域 */
.input-area {
  border-top: 1px solid #e4e7ed;
  padding: 15px 20px;
  background: #fafafa;
}

.input-container {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.input-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.quick-replies {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.quick-replies .el-button {
  font-size: 12px;
  padding: 4px 8px;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .communication-container {
    padding: 10px;
  }
  
  .chat-area {
    height: 500px;
  }
  
  .message-content {
    max-width: 85%;
  }
  
  .page-header {
    padding: 15px;
  }
  
  .page-header h1 {
    font-size: 20px;
  }
}
</style>
