<template>
  <div class="appointment-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />
    
    <!-- 预约表单 -->
    <div class="appointment-content">
      <div class="container">
        <div class="appointment-form-container">
          <div class="section-header">
            <h1>在线预约参观</h1>
            <p>欢迎预约参观我们的养老院，我们将为您提供专业的咨询服务</p>
          </div>
          
          <el-card class="appointment-card">
            <div slot="header" class="card-header">
              <h2>预约信息</h2>
              <p>请填写以下信息，我们会尽快与您联系</p>
            </div>
            
            <el-form :model="appointmentForm" :rules="appointmentRules" ref="appointmentForm" label-width="100px">
              <el-row :gutter="20">
                <el-col :span="12">
                  <el-form-item label="姓名" prop="name">
                    <el-input v-model="appointmentForm.name" placeholder="请输入您的姓名"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="性别" prop="gender">
                    <el-radio-group v-model="appointmentForm.gender">
                      <el-radio label="男">男</el-radio>
                      <el-radio label="女">女</el-radio>
                    </el-radio-group>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-row :gutter="20">
                <el-col :span="12">
                  <el-form-item label="联系电话" prop="phone">
                    <el-input v-model="appointmentForm.phone" placeholder="请输入联系电话"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="年龄" prop="age">
                    <el-input-number v-model="appointmentForm.age" :min="60" :max="120" placeholder="请输入年龄"></el-input-number>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-row :gutter="20">
                <el-col :span="12">
                  <el-form-item label="预约时间" prop="appointmentTime">
                    <el-date-picker
                      v-model="appointmentForm.appointmentTime"
                      type="datetime"
                      placeholder="选择预约时间"
                      value-format="yyyy-MM-dd HH:mm:ss"
                      :picker-options="pickerOptions">
                    </el-date-picker>
                  </el-form-item>
                </el-col>
                <el-col :span="12">
                  <el-form-item label="参观人数" prop="visitorCount">
                    <el-input-number v-model="appointmentForm.visitorCount" :min="1" :max="10" placeholder="参观人数"></el-input-number>
                  </el-form-item>
                </el-col>
              </el-row>

              <el-form-item label="关系" prop="relationship">
                <el-select v-model="appointmentForm.relationship" placeholder="请选择与老人的关系">
                  <el-option label="本人" value="本人"></el-option>
                  <el-option label="子女" value="子女"></el-option>
                  <el-option label="配偶" value="配偶"></el-option>
                  <el-option label="其他亲属" value="其他亲属"></el-option>
                  <el-option label="朋友" value="朋友"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="健康状况" prop="healthStatus">
                <el-select v-model="appointmentForm.healthStatus" placeholder="请选择健康状况">
                  <el-option label="健康" value="健康"></el-option>
                  <el-option label="亚健康" value="亚健康"></el-option>
                  <el-option label="需要护理" value="需要护理"></el-option>
                  <el-option label="需要医疗护理" value="需要医疗护理"></el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="特殊需求" prop="specialNeeds">
                <el-input v-model="appointmentForm.specialNeeds" type="textarea" :rows="4" placeholder="请描述特殊需求或关注的问题"></el-input>
              </el-form-item>

              <el-form-item label="备注" prop="remark">
                <el-input v-model="appointmentForm.remark" type="textarea" :rows="3" placeholder="其他需要说明的信息"></el-input>
              </el-form-item>

              <el-form-item>
                <el-button type="primary" size="large" @click="submitAppointment" :loading="submitting">提交预约</el-button>
                <el-button size="large" @click="resetForm">重置</el-button>
              </el-form-item>
            </el-form>
          </el-card>
        </div>

        <!-- 预约须知 -->
        <div class="appointment-notice">
          <el-card>
            <div slot="header">
              <h3>预约须知</h3>
            </div>
            <div class="notice-content">
              <ul>
                <li>预约参观时间为周一至周日 9:00-17:00</li>
                <li>请提前1-2天预约，我们会根据您的时间安排参观</li>
                <li>参观时请携带有效身份证件</li>
                <li>我们会安排专业的咨询师为您详细介绍服务内容</li>
                <li>如有疑问，请随时拨打我们的咨询电话：400-123-4567</li>
                <li>我们承诺保护您的个人信息安全</li>
              </ul>
            </div>
          </el-card>
        </div>
      </div>
    </div>


    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import WebsiteNavbar from '@/components/WebsiteNavbar'
import BackToTop from '@/components/BackToTop'
import { addAppointment } from '@/api/website/appointment'

export default {
  name: 'AppointmentPage',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '在线预约 - 智慧养老院'
  },
  data() {
    return {
      submitting: false,
      appointmentForm: {
        name: '',
        gender: '',
        phone: '',
        age: null,
        appointmentTime: '',
        visitorCount: 1,
        relationship: '',
        healthStatus: '',
        specialNeeds: '',
        remark: ''
      },
      appointmentRules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        gender: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        phone: [
          { required: true, message: '请输入联系电话', trigger: 'blur' },
          { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
        ],
        age: [
          { required: true, message: '请输入年龄', trigger: 'blur' }
        ],
        appointmentTime: [
          { required: true, message: '请选择预约时间', trigger: 'change' }
        ],
        visitorCount: [
          { required: true, message: '请输入参观人数', trigger: 'blur' }
        ],
        relationship: [
          { required: true, message: '请选择关系', trigger: 'change' }
        ],
        healthStatus: [
          { required: true, message: '请选择健康状况', trigger: 'change' }
        ]
      },
      pickerOptions: {
        disabledDate(time) {
          // 禁用过去的日期
          return time.getTime() < Date.now() - 8.64e7;
        },
        disabledHours() {
          // 禁用非工作时间
          const hours = [];
          for (let i = 0; i < 9; i++) {
            hours.push(i);
          }
          for (let i = 18; i < 24; i++) {
            hours.push(i);
          }
          return hours;
        }
      }
    }
  },
  methods: {
    async submitAppointment() {
      this.$refs.appointmentForm.validate(async (valid) => {
        if (valid) {
          this.submitting = true;
          
          try {
            // 调用后端API提交预约信息
            console.log('提交预约数据:', {
              name: this.appointmentForm.name,
              gender: this.appointmentForm.gender,
              phone: this.appointmentForm.phone,
              age: this.appointmentForm.age,
              appointmentTime: this.appointmentForm.appointmentTime,
              visitorCount: this.appointmentForm.visitorCount,
              relationship: this.appointmentForm.relationship,
              healthStatus: this.appointmentForm.healthStatus,
              specialNeeds: this.appointmentForm.specialNeeds,
              remark: this.appointmentForm.remark
            });
            
            const response = await addAppointment({
              name: this.appointmentForm.name,
              gender: this.appointmentForm.gender,
              phone: this.appointmentForm.phone,
              age: this.appointmentForm.age,
              appointmentTime: this.appointmentForm.appointmentTime,
              visitorCount: this.appointmentForm.visitorCount,
              relationship: this.appointmentForm.relationship,
              healthStatus: this.appointmentForm.healthStatus,
              specialNeeds: this.appointmentForm.specialNeeds,
              remark: this.appointmentForm.remark
            });
            
            console.log('API响应:', response);
            
            if (response.code === 200) {
              this.$message.success('预约提交成功！我们会在24小时内与您联系确认参观时间。');
              this.resetForm();
            } else {
              this.$message.error(response.msg || '提交失败，请重试');
            }
          } catch (error) {
            console.error('提交预约失败:', error);
            if (error.response && error.response.data && error.response.data.msg) {
              this.$message.error(error.response.data.msg);
            } else if (error.message) {
              this.$message.error(error.message);
            } else {
              this.$message.error('网络错误，请检查网络连接后重试');
            }
          } finally {
            this.submitting = false;
          }
        }
      });
    },
    resetForm() {
      this.$refs.appointmentForm.resetFields();
      this.appointmentForm = {
        name: '',
        gender: '',
        phone: '',
        age: null,
        appointmentTime: '',
        visitorCount: 1,
        relationship: '',
        healthStatus: '',
        specialNeeds: '',
        remark: ''
      };
    }
  }
}
</script>

<style lang="scss" scoped>
.appointment-page {
  min-height: 100vh;
  background: #f5f7fa;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

// 预约内容
.appointment-content {
  padding: 80px 0 60px;
  margin-top: 80px;

  .appointment-form-container {
    margin-bottom: 40px;
  }

  .section-header {
    text-align: center;
    margin-bottom: 50px;

    h1 {
      font-size: 42px;
      color: #2c3e50;
      margin-bottom: 15px;
      font-weight: 600;
    }

    p {
      font-size: 18px;
      color: #7f8c8d;
      margin: 0;
    }
  }

  .appointment-card {
    max-width: 800px;
    margin: 0 auto;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);

    .card-header {
      text-align: center;
      padding: 20px 0;

      h2 {
        color: #2c3e50;
        margin-bottom: 10px;
      }

      p {
        color: #7f8c8d;
        margin: 0;
      }
    }
  }

  .appointment-notice {
    max-width: 800px;
    margin: 0 auto;

    .notice-content {
      ul {
        list-style: none;
        padding: 0;

        li {
          padding: 10px 0;
          border-bottom: 1px solid #f0f0f0;
          color: #5a6c7d;
          position: relative;
          padding-left: 20px;

          &:before {
            content: '•';
            color: #3498db;
            position: absolute;
            left: 0;
          }

          &:last-child {
            border-bottom: none;
          }
        }
      }
    }
  }
}


// 响应式设计
@media (max-width: 768px) {
  .appointment-content {
    padding: 60px 0 40px;
    margin-top: 70px;

    .section-header {
      margin-bottom: 30px;

      h1 {
        font-size: 32px;
      }

      p {
        font-size: 16px;
      }
    }
  }

}
</style>
