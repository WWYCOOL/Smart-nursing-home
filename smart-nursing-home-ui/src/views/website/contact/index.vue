<template>
  <div class="contact-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />
    


    <!-- 常见问题 -->
    <section class="faq-section">
      <div class="container">
        <div class="section-header">
          <h2>常见问题</h2>
          <p>解答您关心的问题</p>
        </div>
        <div class="faq-list">
          <el-collapse v-model="activeFaq">
            <el-collapse-item name="1">
              <template slot="title">
                <span class="faq-title">入住需要什么条件？</span>
              </template>
              <p>入住需要提供身份证、体检报告、家属身份证等材料。我们会根据老人的身体状况和需求，提供相应的服务方案。</p>
            </el-collapse-item>
            <el-collapse-item name="2">
              <template slot="title">
                <span class="faq-title">费用如何计算？</span>
              </template>
              <p>费用根据房间类型、护理等级、服务项目等因素计算。我们提供透明的收费标准，无隐藏费用。</p>
            </el-collapse-item>
            <el-collapse-item name="3">
              <template slot="title">
                <span class="faq-title">可以随时探视吗？</span>
              </template>
              <p>家属可以随时探视，我们鼓励家属多与老人交流。同时我们也提供视频通话服务，方便远程探视。</p>
            </el-collapse-item>
            <el-collapse-item name="4">
              <template slot="title">
                <span class="faq-title">医疗护理如何保障？</span>
              </template>
              <p>我们配备专业医护团队，与附近医院建立绿色通道，24小时提供医疗护理服务。</p>
            </el-collapse-item>
            <el-collapse-item name="5">
              <template slot="title">
                <span class="faq-title">可以试住吗？</span>
              </template>
              <p>我们提供试住服务，让老人和家属更好地了解我们的服务，试住期间费用优惠。</p>
            </el-collapse-item>
          </el-collapse>
        </div>
      </div>
    </section>

    <!-- 在线咨询表单 -->
    <section class="contact-form-section">
      <div class="container">
        <div class="section-header">
          <h2>在线咨询</h2>
          <p>请填写以下信息，我们会尽快与您联系</p>
        </div>
        
        <div class="form-container">
          <el-form :model="contactForm" :rules="contactRules" ref="contactForm" label-width="100px">
            <el-row :gutter="20">
              <el-col :span="12">
                <el-form-item label="姓名" prop="name">
                  <el-input v-model="contactForm.name" placeholder="请输入您的姓名"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="联系电话" prop="phone">
                  <el-input v-model="contactForm.phone" placeholder="请输入联系电话"></el-input>
                </el-form-item>
              </el-col>
            </el-row>

            <el-row :gutter="20">
              <el-col :span="12">
                <el-form-item label="关系" prop="relationship">
                  <el-select v-model="contactForm.relationship" placeholder="请选择与老人的关系">
                    <el-option label="本人" value="本人"></el-option>
                    <el-option label="子女" value="子女"></el-option>
                    <el-option label="配偶" value="配偶"></el-option>
                    <el-option label="其他亲属" value="其他亲属"></el-option>
                    <el-option label="朋友" value="朋友"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="咨询类型" prop="consultationType">
                  <el-select v-model="contactForm.consultationType" placeholder="请选择咨询类型">
                    <el-option label="入住咨询" value="入住咨询"></el-option>
                    <el-option label="服务咨询" value="服务咨询"></el-option>
                    <el-option label="费用咨询" value="费用咨询"></el-option>
                    <el-option label="参观预约" value="参观预约"></el-option>
                    <el-option label="其他" value="其他"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>

            <el-form-item label="咨询内容" prop="message">
              <el-input v-model="contactForm.message" type="textarea" :rows="4" placeholder="请描述您想了解的问题或需求"></el-input>
            </el-form-item>

            <el-form-item>
              <el-button type="primary" size="large" @click="submitForm" :loading="submitting">提交咨询</el-button>
              <el-button size="large" @click="resetForm">重置</el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </section>


    <!-- 联系信息 -->
    <section class="contact-info">
      <div class="container">
        <div class="contact-grid">
          <div class="contact-item">
            <div class="contact-icon">
              <i class="el-icon-phone"></i>
            </div>
            <div class="contact-details">
              <h3>咨询电话</h3>
              <p class="contact-value">400-123-4567</p>
              <p class="contact-desc">24小时服务热线，随时为您解答疑问</p>
            </div>
          </div>
          <div class="contact-item">
            <div class="contact-icon">
              <i class="el-icon-location"></i>
            </div>
            <div class="contact-details">
              <h3>地址</h3>
              <p class="contact-value">北京市朝阳区智慧养老院路123号</p>
              <p class="contact-desc">地铁1号线建国门站A出口，步行5分钟</p>
            </div>
          </div>
          <div class="contact-item">
            <div class="contact-icon">
              <i class="el-icon-message"></i>
            </div>
            <div class="contact-details">
              <h3>邮箱</h3>
              <p class="contact-value">info@nursinghome.com</p>
              <p class="contact-desc">24小时内回复您的邮件</p>
            </div>
          </div>
          <div class="contact-item">
            <div class="contact-icon">
              <i class="el-icon-time"></i>
            </div>
            <div class="contact-details">
              <h3>参观时间</h3>
              <p class="contact-value">周一至周日 9:00-17:00</p>
              <p class="contact-desc">欢迎预约参观，我们将安排专人接待</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import WebsiteNavbar from '@/components/WebsiteNavbar'
import BackToTop from '@/components/BackToTop'
import { addConsultation } from '@/api/website/consultation'

export default {
  name: 'ContactPage',
  components: {
    WebsiteNavbar,
    BackToTop
  },
  created() {
    // 设置页面标题
    document.title = '联系我们 - 智慧养老院'
  },
  data() {
    return {
      submitting: false,
      activeFaq: [],
      contactForm: {
        name: '',
        phone: '',
        relationship: '',
        consultationType: '',
        message: ''
      },
      contactRules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '请输入联系电话', trigger: 'blur' },
          { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
        ],
        relationship: [
          { required: true, message: '请选择关系', trigger: 'change' }
        ],
        consultationType: [
          { required: true, message: '请选择咨询类型', trigger: 'change' }
        ],
        message: [
          { required: true, message: '请输入咨询内容', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    async submitForm() {
      this.$refs.contactForm.validate(async (valid) => {
        if (valid) {
          this.submitting = true;
          
          try {
            // 调用后端API提交咨询信息
            console.log('提交咨询数据:', {
              name: this.contactForm.name,
              phone: this.contactForm.phone,
              relationship: this.contactForm.relationship,
              consultationType: this.contactForm.consultationType,
              message: this.contactForm.message
            });
            
            const response = await addConsultation({
              name: this.contactForm.name,
              phone: this.contactForm.phone,
              relationship: this.contactForm.relationship,
              consultationType: this.contactForm.consultationType,
              message: this.contactForm.message
            });
            
            console.log('API响应:', response);
            
            if (response.code === 200) {
              this.$message.success('咨询信息已提交，我们会尽快与您联系！');
              this.resetForm();
            } else {
              this.$message.error(response.msg || '提交失败，请重试');
            }
          } catch (error) {
            console.error('提交咨询失败:', error);
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
      this.$refs.contactForm.resetFields();
      this.contactForm = {
        name: '',
        phone: '',
        relationship: '',
        consultationType: '',
        message: ''
      };
    },
    scrollToForm() {
      const formSection = document.querySelector('.contact-form-section');
      if (formSection) {
        formSection.scrollIntoView({ behavior: 'smooth' });
      }
    },
    makeCall() {
      window.location.href = 'tel:400-123-4567';
    },
    openMap() {
      // 这里可以集成真实的地图服务
      this.$message.info('地图功能开发中...');
    },
    getDirections() {
      // 这里可以集成导航服务
      this.$message.info('导航功能开发中...');
    }
  }
}
</script>

<style lang="scss" scoped>
.contact-page {
  font-family: 'PingFang SC', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}



// 通用section样式
.section-header {
  text-align: center;
  margin-bottom: 60px;

  h2 {
    font-size: 36px;
    color: #2c3e50;
    margin-bottom: 10px;
  }
  p {
    font-size: 18px;
    color: #7f8c8d;
  }
}

// 联系信息
.contact-info {
  padding: 60px 0 80px;
  background: white;

  .contact-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;

    .contact-item {
      display: flex;
      align-items: center;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;

      &:hover {
        transform: translateY(-5px);
      }

      .contact-icon {
        font-size: 48px;
        color: #3498db;
        margin-right: 20px;
      }

      .contact-details {
        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        .contact-value {
          color: #3498db;
          font-size: 18px;
          font-weight: bold;
          margin-bottom: 5px;
        }

        .contact-desc {
          color: #7f8c8d;
          font-size: 14px;
          margin: 0;
        }
      }
    }
  }
}

// 在线咨询表单
.contact-form-section {
  padding: 80px 0;
  background: #f8f9fa;

  .form-container {
    max-width: 800px;
    margin: 0 auto;
    background: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  }
}


// 常见问题
.faq-section {
  padding: 80px 0;
  background: white;

  .faq-list {
    max-width: 800px;
    margin: 0 auto;

    .el-collapse {
      .el-collapse-item {
        margin-bottom: 15px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

        .el-collapse-item__header {
          background: #f8f9fa;
          padding: 25px 20px;
          font-weight: 500;
          color: #2c3e50;
          text-align: center;
          display: flex;
          align-items: center;
          justify-content: center;
          transition: all 0.3s ease;

          &:hover {
            background: #e9ecef;
            color: #007bff;
          }

          .el-collapse-item__arrow {
            color: #007bff;
            font-size: 14px;
            margin-left: 10px;
          }

          .faq-title {
            font-size: 16px;
            font-weight: 500;
            color: #2c3e50;
            letter-spacing: 0.3px;
            text-align: center;
            flex: 1;
            transition: all 0.3s ease;
          }
        }

        .el-collapse-item__content {
          padding: 25px;
          background: white;

          p {
            color: #7f8c8d;
            line-height: 1.8;
            margin: 0;
            text-align: center;
            font-size: 15px;
          }
        }
      }
    }
  }
}


// 响应式设计
@media (max-width: 768px) {

  .contact-grid {
    grid-template-columns: 1fr !important;
  }

  .contact-item {
    flex-direction: column !important;
    text-align: center;

    .contact-icon {
      margin-right: 0 !important;
      margin-bottom: 15px;
    }
  }

  .form-container {
    padding: 20px !important;
  }

}


// 地图位置
.map-section {
  padding: 80px 0;
  background: white;

  .map-container {
    .map-placeholder {
      height: 400px;
      background: #f8f9fa;
      border-radius: 10px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      color: #6c757d;
      text-align: center;

      i {
        font-size: 80px;
        margin-bottom: 20px;
        color: #3498db;
      }

      h3 {
        color: #2c3e50;
        margin-bottom: 10px;
      }

      p {
        margin-bottom: 30px;
      }

      .map-actions {
        display: flex;
        gap: 15px;
      }
    }
  }
}

// 交通指南
.transportation-guide {
  padding: 80px 0;
  background: #f8f9fa;

  .transportation-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;

    .transport-item {
      display: flex;
      align-items: center;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      .transport-icon {
        font-size: 48px;
        color: #27ae60;
        margin-right: 20px;
      }

      .transport-content {
        h3 {
          color: #2c3e50;
          margin-bottom: 10px;
        }

        p {
          color: #7f8c8d;
          line-height: 1.6;
          margin: 0;
        }
      }
    }
  }
}

// 常见问题
.faq-section {
  padding: 80px 0;
  background: white;

  .faq-list {
    max-width: 800px;
    margin: 0 auto;

    .el-collapse {
      .el-collapse-item {
        margin-bottom: 15px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);

        .el-collapse-item__header {
          background: #f8f9fa;
          padding: 20px;
          font-weight: 500;
          color: #2c3e50;
        }

        .el-collapse-item__content {
          padding: 20px;
          background: white;

          p {
            color: #7f8c8d;
            line-height: 1.6;
            margin: 0;
          }
        }
      }
    }
  }
}

// 联系我们
.contact-actions {
  padding: 80px 0;
  background: #f8f9fa;

  .actions-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;

    .action-item {
      text-align: center;
      background: white;
      padding: 40px 30px;
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);

      h3 {
        color: #2c3e50;
        margin-bottom: 15px;
      }

      p {
        color: #7f8c8d;
        margin-bottom: 25px;
      }
    }
  }
}

// 响应式设计
@media (max-width: 768px) {
  .page-header {
    padding: 60px 0;

    h1 {
      font-size: 36px;
    }
  }

  .contact-grid,
  .transportation-grid {
    grid-template-columns: 1fr !important;
  }

  .contact-item,
  .transport-item {
    flex-direction: column !important;
    text-align: center;

    .contact-icon,
    .transport-icon {
      margin-right: 0 !important;
      margin-bottom: 15px;
    }
  }

  .form-container {
    padding: 20px !important;
  }

  .map-actions {
    flex-direction: column !important;
  }

  .actions-content {
    grid-template-columns: 1fr !important;
  }
}
</style>

