<template>
  <div class="family-login-page">
    <!-- 顶部导航栏 -->
    <WebsiteNavbar />

    <!-- 登录表单 -->
    <div class="login-content">
      <div class="container">
        <el-form
          ref="loginForm"
          :model="loginMode === 'login' ? loginForm : registerForm"
          :rules="{}"
          class="login-form"
        >
          <h3 class="title">家属登录</h3>
          <div class="login-tabs">
            <el-button
              :type="loginMode === 'login' ? 'primary' : 'text'"
              @click="loginMode = 'login'"
              class="tab-button"
            >
              登录
            </el-button>
            <el-button
              :type="loginMode === 'register' ? 'primary' : 'text'"
              @click="loginMode = 'register'"
              class="tab-button"
            >
              注册
            </el-button>
          </div>
          <!-- 登录模式 -->
          <template v-if="loginMode === 'login'">
            <el-form-item prop="username">
              <el-input
                v-model="loginForm.username"
                type="text"
                auto-complete="off"
                placeholder="用户名/手机号"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="user"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input
                v-model="loginForm.password"
                type="password"
                auto-complete="off"
                placeholder="密码"
                @keyup.enter.native="handleLogin"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="password"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
          </template>

          <!-- 注册模式 -->
          <template v-if="loginMode === 'register'">
            <el-form-item prop="familyName">
              <el-input
                v-model="registerForm.familyName"
                type="text"
                auto-complete="off"
                placeholder="家属姓名"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="user"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="phone">
              <el-input
                v-model="registerForm.phone"
                type="text"
                auto-complete="off"
                placeholder="手机号"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="phone"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="username">
              <el-input
                v-model="registerForm.username"
                type="text"
                auto-complete="off"
                placeholder="用户名"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="user"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input
                v-model="registerForm.password"
                type="password"
                auto-complete="off"
                placeholder="密码"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="password"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="confirmPassword">
              <el-input
                v-model="registerForm.confirmPassword"
                type="password"
                auto-complete="off"
                placeholder="确认密码"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="password"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="elderlyName">
              <el-input
                v-model="registerForm.elderlyName"
                type="text"
                auto-complete="off"
                placeholder="老人姓名"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="peoples"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="elderlyIdCard">
              <el-input
                v-model="registerForm.elderlyIdCard"
                type="text"
                auto-complete="off"
                placeholder="老人身份证号"
              >
                <svg-icon
                  slot="prefix"
                  icon-class="idcard"
                  class="el-input__icon input-icon"
                />
              </el-input>
            </el-form-item>
            <el-form-item prop="relationship">
              <el-select
                v-model="registerForm.relationship"
                placeholder="与老人关系"
                style="width: 100%"
              >
                <!-- <el-option label="子女" value="children"></el-option>
                <el-option label="配偶" value="spouse"></el-option>
                <el-option label="兄弟姐妹" value="sibling"></el-option>
                <el-option label="其他" value="other"></el-option> -->
                <el-option
                  v-for="dict in dict.type.family_relationship"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </template>

          <!-- 验证码只在登录模式下显示 -->
          <el-form-item
            prop="code"
            v-if="captchaEnabled && loginMode === 'login'"
          >
            <el-input
              v-model="loginForm.code"
              auto-complete="off"
              placeholder="验证码"
              style="width: 63%"
              @keyup.enter.native="handleLogin"
            >
              <svg-icon
                slot="prefix"
                icon-class="validCode"
                class="el-input__icon input-icon"
              />
            </el-input>
            <div class="login-code">
              <img :src="codeUrl" @click="getCode" class="login-code-img" />
            </div>
          </el-form-item>
          <el-checkbox
            v-model="loginForm.rememberMe"
            style="margin: 0px 0px 25px 0px"
            >记住密码</el-checkbox
          >
          <el-form-item style="width: 100%">
            <el-button
              :loading="loading"
              size="medium"
              type="primary"
              style="width: 100%"
              @click.native.prevent="
                loginMode === 'login' ? handleLogin() : handleRegister()
              "
            >
              <span v-if="!loading">{{
                loginMode === "login" ? "登 录" : "注 册"
              }}</span>
              <span v-else>{{
                loginMode === "login" ? "登 录 中..." : "注 册 中..."
              }}</span>
            </el-button>
            <div style="float: right" v-if="loginMode === 'login'">
              <el-link type="primary" @click="loginMode = 'register'"
                >立即注册</el-link
              >
            </div>
            <div style="float: right" v-if="loginMode === 'register'">
              <el-link type="primary" @click="loginMode = 'login'"
                >返回登录</el-link
              >
            </div>
          </el-form-item>
        </el-form>
      </div>

      <!-- 功能说明 -->
      <div class="features-section">
        <div class="features-grid">
          <div class="feature-item">
            <div class="feature-icon">
              <i class="el-icon-view"></i>
            </div>
            <h3>实时查看</h3>
            <p>实时查看老人的生活状况、健康数据和活动记录</p>
          </div>
          <div class="feature-item">
            <div class="feature-icon">
              <i class="el-icon-chat-line-round"></i>
            </div>
            <h3>在线沟通</h3>
            <p>与护理人员在线沟通，了解老人最新情况</p>
          </div>
          <div class="feature-item">
            <div class="feature-icon">
              <i class="el-icon-document"></i>
            </div>
            <h3>健康报告</h3>
            <p>查看详细的健康检查报告和护理记录</p>
          </div>
          <div class="feature-item">
            <div class="feature-icon">
              <i class="el-icon-camera"></i>
            </div>
            <h3>生活照片</h3>
            <p>查看老人在养老院的日常生活照片</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 注册对话框 -->
    <el-dialog title="家属注册" :visible.sync="registerVisible" width="600px">
      <el-form
        :model="registerForm"
        :rules="registerRules"
        ref="registerForm"
        label-width="100px"
      >
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="姓名" prop="name">
              <el-input
                v-model="registerForm.name"
                placeholder="请输入姓名"
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="关系" prop="relationship">
              <el-select
                v-model="registerForm.relationship"
                placeholder="请选择关系"
              >
                <el-option label="子女" value="子女"></el-option>
                <el-option label="配偶" value="配偶"></el-option>
                <el-option label="其他亲属" value="其他亲属"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="手机号" prop="phone">
          <el-input
            v-model="registerForm.phone"
            placeholder="请输入手机号"
          ></el-input>
        </el-form-item>
        <el-form-item label="验证码" prop="smsCode">
          <el-row :gutter="10">
            <el-col :span="14">
              <el-input
                v-model="registerForm.smsCode"
                placeholder="请输入验证码"
              ></el-input>
            </el-col>
            <el-col :span="10">
              <el-button
                @click="sendRegisterSmsCode"
                :disabled="registerSmsCountdown > 0"
              >
                {{
                  registerSmsCountdown > 0
                    ? `${registerSmsCountdown}s`
                    : "发送验证码"
                }}
              </el-button>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input
            v-model="registerForm.password"
            type="password"
            placeholder="请输入密码"
          ></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input
            v-model="registerForm.confirmPassword"
            type="password"
            placeholder="请再次输入密码"
          ></el-input>
        </el-form-item>
        <el-form-item label="老人姓名" prop="elderlyName">
          <el-input
            v-model="registerForm.elderlyName"
            placeholder="请输入入住老人姓名"
          ></el-input>
        </el-form-item>
        <el-form-item label="老人房间" prop="elderlyRoom">
          <el-input
            v-model="registerForm.elderlyRoom"
            placeholder="请输入老人房间号"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer">
        <el-button @click="registerVisible = false">取消</el-button>
        <el-button type="primary" @click="handleRegister">注册</el-button>
      </div>
    </el-dialog>

    <!-- 返回顶部按钮 -->
    <BackToTop />
  </div>
</template>

<script>
import WebsiteNavbar from "@/components/WebsiteNavbar";
import BackToTop from "@/components/BackToTop";
import { getCodeImg, login } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import {
  registerFamilyUser,
  getElderlyByIdCard,
  createFamilyElderlyRelation,
  loginFamilyUser,
} from "@/api/website/family-user";

export default {
  name: "FamilyLoginPage",
  dicts: ["family_relationship", "bind_status"],
  components: {
    WebsiteNavbar,
    BackToTop,
  },
  created() {
    // 设置页面标题
    document.title = "家属登录 - 智慧养老院";
  },
  data() {
    return {
      codeUrl: "",
      registerVisible: false,
      registerSmsCountdown: 0,
      loginMode: "login", // 登录模式：'login' 或 'register'
      loginForm: {
        username: "",
        password: "",
        rememberMe: false,
        code: "",
        uuid: "",
      },
      loginRules: {
        username: [{ required: true, message: "请输入您的用户名" }],
        password: [{ required: true, message: "请输入您的密码" }],
        code: [{ required: false, message: "请输入验证码" }],
      },
      registerForm: {
        familyName: "",
        phone: "",
        username: "",
        password: "",
        confirmPassword: "",
        elderlyName: "",
        elderlyIdCard: "",
        relationship: "",
      },
      registerRules: {
        familyName: [{ required: true, message: "请输入家属姓名" }],
        phone: [
          { required: true, message: "请输入手机号" },
          { pattern: /^1[3-9]\d{9}$/, message: "请输入正确的手机号码" },
        ],
        username: [
          { required: true, message: "请输入用户名" },
          { min: 3, max: 20, message: "用户名长度在3到20个字符" },
        ],
        password: [
          { required: true, message: "请输入密码" },
          { min: 6, message: "密码长度不能少于6位" },
        ],
        confirmPassword: [{ required: true, message: "请确认密码" }],
        elderlyName: [{ required: true, message: "请输入老人姓名" }],
        elderlyIdCard: [
          { required: true, message: "请输入老人身份证号" },
          {
            pattern:
              /^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
            message: "请输入正确的身份证号",
          },
        ],
        relationship: [{ required: true, message: "请选择与老人关系" }],
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
    };
  },
  created() {
    this.getCode(); // 重新启用验证码获取
    this.getCookie();
  },
  methods: {
    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("family_username");
      const password = Cookies.get("family_password");
      const rememberMe = Cookies.get("family_rememberMe");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password:
          password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe),
      };
    },
    handleLogin() {
      // 手动验证
      if (!this.loginForm.username) {
        this.$message.error("请输入用户名");
        return;
      }
      if (!this.loginForm.password) {
        this.$message.error("请输入密码");
        return;
      }
      if (this.captchaEnabled && !this.loginForm.code) {
        this.$message.error("请输入验证码");
        return;
      }

      this.loading = true;
      if (this.loginForm.rememberMe) {
        Cookies.set("family_username", this.loginForm.username, {
          expires: 30,
        });
        Cookies.set("family_password", encrypt(this.loginForm.password), {
          expires: 30,
        });
        Cookies.set("family_rememberMe", this.loginForm.rememberMe, {
          expires: 30,
        });
      } else {
        Cookies.remove("family_username");
        Cookies.remove("family_password");
        Cookies.remove("family_rememberMe");
      }

      // 使用家属专用登录接口
      loginFamilyUser(this.loginForm)
        .then((response) => {
          if (response.code === 200) {
            // 保存用户信息到localStorage
            const familyUser = {
              familyId: response.data.familyId,
              familyName: response.data.familyName,
              username: response.data.username,
              phone: response.data.phone,
            };
            localStorage.setItem("family_user", JSON.stringify(familyUser));

            this.$message.success("登录成功！");
            // 跳转到家属管理页面
            this.$router.push("/family/dashboard");
          } else {
            this.$message.error(response.msg || "登录失败");
            this.loading = false;
            if (this.captchaEnabled) {
              this.getCode();
            }
          }
        })
        .catch((error) => {
          this.$message.error("登录失败：" + (error.message || "未知错误"));
          this.loading = false;
          if (this.captchaEnabled) {
            this.getCode();
          }
        });
    },
    // 处理注册
    handleRegister() {
      // 手动验证
      if (!this.registerForm.familyName) {
        this.$message.error("请输入家属姓名");
        return;
      }
      if (!this.registerForm.phone) {
        this.$message.error("请输入手机号");
        return;
      }
      if (!this.registerForm.username) {
        this.$message.error("请输入用户名");
        return;
      }
      if (!this.registerForm.password) {
        this.$message.error("请输入密码");
        return;
      }
      if (this.registerForm.password !== this.registerForm.confirmPassword) {
        this.$message.error("两次输入的密码不一致");
        return;
      }
      if (!this.registerForm.elderlyName) {
        this.$message.error("请输入老人姓名");
        return;
      }
      if (!this.registerForm.elderlyIdCard) {
        this.$message.error("请输入老人身份证号");
        return;
      }
      if (!this.registerForm.relationship) {
        this.$message.error("请选择与老人关系");
        return;
      }

      this.loading = true;

      // 调用注册API
      this.registerFamilyUser()
        .then(() => {
          this.loading = false;
          this.$message.success("注册成功！请等待管理员审核绑定关系");
          this.loginMode = "login";
          this.resetRegisterForm();
        })
        .catch((error) => {
          this.loading = false;
          this.$message.error("注册失败：" + (error.message || "未知错误"));
        });
    },
    // 注册家属用户
    registerFamilyUser() {
      return new Promise((resolve, reject) => {
        // 先验证老人信息
        const cleanIdCard = this.registerForm.elderlyIdCard.trim();
        getElderlyByIdCard(cleanIdCard)
          .then((response) => {
            if (response.code === 200) {
              // 老人信息验证成功，创建家属用户
              const familyData = {
                familyName: this.registerForm.familyName,
                phone: this.registerForm.phone,
                username: this.registerForm.username,
                password: this.registerForm.password,
                relationship: this.registerForm.relationship,
              };

              registerFamilyUser(familyData)
                .then((response) => {
                  if (response.code === 200) {
                    // 家属用户创建成功，创建绑定关系
                    const relationData = {
                      familyId: response.data, // response.data 直接就是 familyId
                      elderlyIdCard: cleanIdCard,
                      relationship: this.registerForm.relationship,
                    };

                    createFamilyElderlyRelation(relationData)
                      .then((response) => {
                        if (response.code === 200) {
                          resolve();
                        } else {
                          console.error("创建绑定关系失败:", response);
                          reject(new Error(response.msg || "创建绑定关系失败"));
                        }
                      })
                      .catch((error) => {
                        console.error("创建绑定关系异常:", error);
                        reject(error);
                      });
                  } else {
                    reject(new Error(response.msg || "注册失败"));
                  }
                })
                .catch((error) => {
                  reject(error);
                });
            } else {
              reject(new Error(response.msg || "老人信息验证失败"));
            }
          })
          .catch((error) => {
            reject(error);
          });
      });
    },
    // 重置注册表单
    resetRegisterForm() {
      this.registerForm = {
        familyName: "",
        phone: "",
        username: "",
        password: "",
        confirmPassword: "",
        elderlyName: "",
        elderlyIdCard: "",
        relationship: "",
      };
    },
    // 显示注册对话框
    showRegister() {
      this.registerVisible = true;
    },
    // 发送注册短信验证码
    sendRegisterSmsCode() {
      if (!this.registerForm.phone) {
        this.$message.error("请先输入手机号");
        return;
      }

      this.registerSmsCountdown = 60;
      const timer = setInterval(() => {
        this.registerSmsCountdown--;
        if (this.registerSmsCountdown <= 0) {
          clearInterval(timer);
        }
      }, 1000);

      this.$message.success("验证码已发送");
    },
  },
};
</script>

<style lang="scss" scoped>
.family-login-page {
  min-height: 100vh;
  background: url("https://imgvz.vsszan.com/forum/201503/30/093557hdead8vot3hpdmza.jpg")
    center/cover no-repeat;
  position: relative;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

// 登录内容
.login-content {
  padding: 80px 0 60px;
  margin-top: 80px;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: calc(100vh - 80px);

  .login-form {
    border-radius: 12px;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(15px);
    width: 400px;
    padding: 25px 25px 5px 25px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    margin-bottom: 40px;
    border: 1px solid rgba(255, 255, 255, 0.3);

    .el-input {
      height: 38px;
      input {
        height: 38px;
      }
    }
    .input-icon {
      height: 39px;
      width: 14px;
      margin-left: 2px;
    }
  }

  .title {
    margin: 0px auto 20px auto;
    text-align: center;
    color: #2c3e50;
    font-size: 24px;
    font-weight: 600;
  }

  .login-tabs {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
    border-bottom: 1px solid #e8e8e8;

    .tab-button {
      border: none;
      background: none;
      padding: 10px 20px;
      font-size: 14px;
      color: #666;
      cursor: pointer;
      border-bottom: 2px solid transparent;
      transition: all 0.3s ease;

      &:hover {
        color: #409eff;
      }

      &.el-button--primary {
        color: #409eff;
        border-bottom-color: #409eff;
      }
    }
  }

  .login-code {
    width: 33%;
    height: 38px;
    float: right;
    img {
      cursor: pointer;
      vertical-align: middle;
    }
  }

  .login-code-img {
    height: 38px;
  }
}

// 功能说明
.features-section {
  width: 1000px;
  max-width: 95%;

  .features-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;

    .feature-item {
      text-align: center;
      padding: 20px 15px;
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(12px);
      border-radius: 12px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease;
      border: 1px solid rgba(255, 255, 255, 0.3);
      min-height: 140px;
      display: flex;
      flex-direction: column;
      justify-content: center;

      &:hover {
        transform: translateY(-8px);
        box-shadow: 0 16px 40px rgba(0, 0, 0, 0.2);
        border-color: rgba(52, 152, 219, 0.3);
        background: rgba(255, 255, 255, 0.95);
      }

      .feature-icon {
        font-size: 28px;
        color: #3498db;
        margin-bottom: 12px;
      }

      h3 {
        color: #2c3e50;
        margin-bottom: 8px;
        font-size: 15px;
        font-weight: 600;
      }

      p {
        color: #7f8c8d;
        line-height: 1.5;
        margin: 0;
        font-size: 13px;
      }
    }
  }
}

// 响应式设计
@media (max-width: 768px) {
  .login-content {
    padding: 60px 0 40px;
    margin-top: 70px;
    flex-direction: column;
    align-items: center;

    .login-form {
      margin-right: 0;
      margin-bottom: 40px;
      width: 100%;
      max-width: 400px;
    }

    .features-section {
      width: 100%;
      max-width: 100%;

      .features-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;

        .feature-item {
          min-height: 120px;
          padding: 15px 12px;

          .feature-icon {
            font-size: 24px;
            margin-bottom: 10px;
          }

          h3 {
            font-size: 14px;
            margin-bottom: 8px;
          }

          p {
            font-size: 12px;
            line-height: 1.4;
          }
        }
      }
    }
  }
}
</style>