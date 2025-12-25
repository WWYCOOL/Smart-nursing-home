<template>
  <div class="family-elderly">
    <!-- 页面标题 -->
    <div class="page-header">
      <h1>老人信息</h1>
      <el-button type="primary" @click="goToDashboard">返回首页</el-button>
    </div>

    <!-- 加载状态 -->
    <div v-if="loading" class="loading-container">
      <div class="loading-content">
        <i class="el-icon-loading"></i>
        <p>加载中...</p>
      </div>
    </div>

    <!-- 老人信息 -->
    <div class="elderly-info" v-if="elderlyInfo && !loading">
      <div class="info-card">
        <div class="elderly-details">
          <h2>{{ elderlyInfo.elderlyName }}</h2>
          <div class="info-row">
            <span class="label">性别：</span>
            <span class="value">{{ elderlyInfo.gender === '0' || elderlyInfo.gender === 0 ? '男' : '女' }}</span>
          </div>
          <div class="info-row">
            <span class="label">年龄：</span>
            <span class="value">{{ calculateAge(elderlyInfo.birthDate) }}岁</span>
          </div>
          <div class="info-row">
            <span class="label">房间号：</span>
            <span class="value">{{ elderlyInfo.roomNumber || '未分配' }}</span>
          </div>
          <div class="info-row">
            <span class="label">入住时间：</span>
            <span class="value">{{ formatDate(elderlyInfo.admissionDate) || '未知' }}</span>
          </div>
          <div class="info-row">
            <span class="label">护理等级：</span>
            <span class="value care-level">{{ elderlyInfo.careLevel || '未知' }}</span>
          </div>
        </div>
      </div>

      <div class="health-summary">
        <h3>健康概况</h3>
        <div class="health-items">
          <div class="health-item">
            <i class="el-icon-heart"></i>
            <span>血压：{{ elderlyInfo.bloodPressure || '正常' }}</span>
          </div>
          <div class="health-item">
            <i class="el-icon-cpu"></i>
            <span>心率：{{ elderlyInfo.heartRate || '正常' }}</span>
          </div>
          <div class="health-item">
            <i class="el-icon-thermometer"></i>
            <span>体温：{{ elderlyInfo.temperature || '正常' }}</span>
          </div>
        </div>
      </div>



      <div class="action-buttons">
        <el-button type="primary" @click="goToHealth">
          <i class="el-icon-document"></i>
          查看健康报告
        </el-button>
      </div>
    </div>

    <!-- 无数据状态 -->
    <div class="no-data" v-if="!loading && !elderlyInfo">
      <i class="el-icon-user"></i>
      <p>暂无关联的老人信息</p>
    </div>
  </div>
</template>

<script>
import { getElderlyListByFamilyId } from "@/api/website/family-user";

export default {
  name: "FamilyElderly",
  data() {
    return {
      userInfo: {
        familyId: null,
        familyName: "",
        username: ""
      },
      elderlyInfo: null,
      elderlyList: [],
      recentNotes: [
        {
          id: 1,
          time: "2024-01-15 14:30",
          content: "老人精神状态良好，食欲正常"
        },
        {
          id: 2,
          time: "2024-01-15 10:20",
          content: "按时服药，血压稳定"
        },
        {
          id: 3,
          time: "2024-01-14 16:45",
          content: "参与康复训练，配合度良好"
        }
      ],
      loading: false
    }
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
  },
  methods: {
    // 初始化用户信息
    initUserInfo() {
      const familyUser = JSON.parse(localStorage.getItem('family_user') || sessionStorage.getItem('family_user') || '{}');
      if (familyUser.familyId) {
        this.userInfo = {
          familyId: familyUser.familyId,
          familyName: familyUser.familyName,
          username: familyUser.username
        };
      }
    },
    loadElderlyInfo() {
      if (!this.userInfo.familyId) {
        this.$message.error('用户信息不完整，请重新登录');
        this.$router.push('/website/family-login');
        return;
      }
      
      this.loading = true;
      console.log('开始调用API，familyId:', this.userInfo.familyId);
      getElderlyListByFamilyId(this.userInfo.familyId).then(response => {
        console.log('API响应:', response);
        if (response.code === 200 && response.data) {
          this.elderlyInfo = response.data;
          console.log('=== 前端接收到的老人信息 ===');
          console.log('完整对象:', this.elderlyInfo);
          console.log('对象类型:', typeof this.elderlyInfo);
          console.log('是否为null:', this.elderlyInfo === null);
          console.log('是否为undefined:', this.elderlyInfo === undefined);
          if (this.elderlyInfo) {
            console.log('房间号:', this.elderlyInfo.roomNumber);
            console.log('入住日期:', this.elderlyInfo.admissionDate);
            console.log('护理等级原始值:', this.elderlyInfo.careLevel);
            console.log('护理等级类型:', typeof this.elderlyInfo.careLevel);
            console.log('护理等级转换后:', this.getCareLevelText(this.elderlyInfo.careLevel));
          }
        } else {
          this.$message.warning('暂未绑定老人信息，请联系管理员');
        }
        this.loading = false;
      }).catch(error => {
        this.$message.error('加载老人信息失败：' + (error.message || '未知错误'));
        this.loading = false;
      });
    },
    getCareLevelText(level) {
      console.log('getCareLevelText 输入参数:', level);
      console.log('getCareLevelText 参数类型:', typeof level);
      console.log('getCareLevelText 参数长度:', level ? level.length : 'null');
      
      if (!level) {
        console.log('护理等级为空，返回未知');
        return '未知';
      }
      
      // 如果已经是文本，直接返回
      if (typeof level === 'string' && ['自理', '半自理', '不能自理', '特护'].includes(level)) {
        console.log('护理等级是有效文本，直接返回:', level);
        return level;
      }
      
      // 如果是数字，进行映射
      const levels = {
        '1': '自理',
        '2': '半自理',
        '3': '不能自理',
        '4': '特护'
      };
      const result = levels[level] || level || '未知';
      console.log('护理等级映射结果:', result);
      return result;
    },
    // 计算年龄
    calculateAge(birthDate) {
      if (!birthDate) return '未知';
      const today = new Date();
      const birth = new Date(birthDate);
      let age = today.getFullYear() - birth.getFullYear();
      const monthDiff = today.getMonth() - birth.getMonth();
      if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
        age--;
      }
      return age;
    },
    // 格式化日期
    formatDate(date) {
      if (!date) return null;
      const d = new Date(date);
      const year = d.getFullYear();
      const month = String(d.getMonth() + 1).padStart(2, '0');
      const day = String(d.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    },
    // 返回首页
    goToDashboard() {
      this.$router.push('/family/dashboard');
    },
    // 健康报告
    goToHealth() {
      this.$router.push('/family/health');
    },
  }
}
</script>

<style scoped>
.family-elderly {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.page-header h1 {
  margin: 0;
  color: #333;
  font-size: 24px;
}

.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 200px;
}

.loading-content {
  text-align: center;
  color: #666;
}

.loading-content i {
  font-size: 24px;
  margin-bottom: 10px;
  animation: rotating 2s linear infinite;
}

.loading-content p {
  margin: 0;
  font-size: 14px;
}

@keyframes rotating {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

.elderly-info {
  max-width: 800px;
  margin: 0 auto;
}

.info-card {
  background: white;
  border-radius: 8px;
  padding: 30px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.elderly-details h2 {
  color: #333;
  margin-bottom: 20px;
  font-size: 24px;
}

.info-row {
  display: flex;
  margin-bottom: 10px;
}

.label {
  width: 80px;
  color: #666;
  font-weight: 500;
}

.value {
  color: #333;
  flex: 1;
}

.care-level {
  color: #409EFF;
  font-weight: 500;
}

.health-summary, .recent-notes {
  background: white;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.health-summary h3, .recent-notes h3 {
  color: #333;
  margin-bottom: 15px;
  border-bottom: 2px solid #409EFF;
  padding-bottom: 10px;
}

.health-items {
  display: flex;
  gap: 30px;
}

.health-item {
  display: flex;
  align-items: center;
  color: #333;
}

.health-item i {
  margin-right: 8px;
  color: #409EFF;
  font-size: 16px;
}

.notes-list {
  max-height: 200px;
  overflow-y: auto;
}

.note-item {
  display: flex;
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.note-item:last-child {
  border-bottom: none;
}

.note-time {
  color: #999;
  font-size: 12px;
  width: 120px;
  flex-shrink: 0;
}

.note-content {
  color: #333;
  flex: 1;
}

.no-data {
  text-align: center;
  padding: 60px 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.no-data i {
  font-size: 64px;
  color: #ccc;
  margin-bottom: 20px;
}

.no-data p {
  color: #666;
  font-size: 16px;
}

.action-buttons {
  text-align: center;
  margin-top: 20px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.action-buttons .el-button {
  padding: 12px 30px;
  font-size: 16px;
}

@media (max-width: 768px) {
  .family-elderly {
    padding: 15px;
  }
  
  .page-header {
    flex-direction: column;
    gap: 15px;
    text-align: center;
  }
  
  .info-card {
    padding: 20px;
  }
  
  .health-items {
    flex-direction: column;
    gap: 15px;
  }
}
</style>
