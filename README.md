# 智慧养老院管理系统 (Smart Nursing Home)

## 简介

本项目是一个基于 [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue) 开发的智慧养老院管理系统。系统旨在通过数字化手段提升养老院的管理效率和服务质量，涵盖了老人管理、家属互动、护理服务、健康监测、财务管理以及网站内容展示等全方位功能。

## 功能模块

基于 `com.smartnursinghome.web.controller.website` 下的控制器，系统包含以下核心功能：

### 1. 老人与入住管理
- **入住办理 (Check-in)**: 处理老人的入住和退住流程 (`WebsiteChickInController`)。
- **老人信息管理**: 维护老人的基本信息档案 (`WebsiteElderlyInfoController`)。
- **健康报告**: 记录和查询老人的健康体检报告 (`WebsiteHealthReportController`)。

### 2. 住宿与设施管理
- **房间管理**: 管理养老院的房间信息 (`WebsiteRoomController`)。
- **床位管理**: 维护床位状态及分配 (`WebsiteBedController`)。
- **设施管理**: 管理院内的各类设施 (`WebsiteFacilitiesController`)。
- **设施概览**: 提供设施的整体视图 (`WebsiteFacilityOverviewController`)。
- **环境特色**: 展示养老院的环境特色 (`WebsiteEnvironmentFeaturesController`)。

### 3. 护理与医疗服务
- **护理项目**: 定义和管理各类护理项目 (`WebsiteNursingProjectController`)。
- **护理任务**: 分配和追踪具体的护理任务 (`WebsiteNursingTaskController`)。
- **照护服务**: 管理日常照护服务内容 (`WebsiteCareServicesController`)。
- **医疗服务**: 提供医疗相关的服务管理 (`WebsiteMedicalServicesController`)。
- **咨询服务**: 处理相关的咨询请求 (`WebsiteConsultationController`)。

### 4. 膳食与营养
- **营养食谱**: 制定和展示营养食谱 (`WebsiteNutritionMenuController`)。
- **营养特色**: 介绍餐饮营养特色 (`WebsiteNutritionFeaturesController`)。

### 5. 家属互动与财务
- **家属用户管理**: 管理家属账号信息 (`WebsiteFamilyUserController`)。
- **家属老人关联**: 维护家属与老人的关系 (`WebsiteFamilyElderlyRelationController`)。
- **费用查询**: 家属查询相关费用 (`WebsiteFeeQueryController`)。
- **费用详情**: 查看详细的费用清单 (`WebsiteFeeDetailController`)。
- **家属缴费**: 处理家属缴费记录 (`WebsiteFamilyFeeController`)。
- **意见反馈**: 收集和处理家属的反馈意见 (`WebsiteFeedbackController`)。

### 6. 运营与活动
- **活动管理**: 组织和管理院内活动 (`WebsiteActivityController`)。
- **预约管理**: 处理参观或探视的预约 (`WebsiteAppointmentController`)。
- **娱乐服务**: 管理娱乐设施和服务 (`WebsiteEntertainmentServicesController`)。
- **统计分析**: 系统数据的统计与分析 (`WebsiteStatisticsController`)。

### 7. 门户网站内容
- **轮播图管理**: 首页轮播图配置 (`WebsiteCarouselController`)。
- **新闻资讯**: 发布和管理养老院新闻 (`WebsiteNewsController`)。
- **通知公告**: 发布系统或院务通知 (`WebsiteNoticeController`)。
- **核心服务**: 展示核心服务内容 (`WebsiteMainServicesController`)。

## 技术栈

### 后端
- **核心框架**: Spring Boot 2.5.15
- **权限安全**: Spring Security 5.7.14 + JWT
- **持久层**: MyBatis
- **数据库连接池**: Druid 1.2.23
- **数据库**: MySQL
- **任务调度**: Quartz
- **API文档**: Swagger 3.0.0
- **工具**: Maven, FastJSON, POI (Excel处理)

### 前端
- **框架**: Vue.js
- **UI组件库**: Element UI
- **样式**: SCSS

## 目录结构

```
smart-nursing-home
├── smart-nursing-home-admin      // 后台管理模块 (包含Controller)
├── smart-nursing-home-common     // 通用模块
├── smart-nursing-home-framework  // 核心框架模块
├── smart-nursing-home-generator  // 代码生成模块
├── smart-nursing-home-quartz     // 定时任务模块
├── smart-nursing-home-system     // 系统模块 (Service/Mapper)
├── smart-nursing-home-ui         // 前端工程
└── pom.xml                       // Maven依赖配置
```

## 快速开始

### 1. 环境准备
- JDK 1.8+
- MySQL 5.7+
- Redis
- Node.js
- Maven

### 2. 后端启动
1. 导入项目到 IDE (IntelliJ IDEA)。
2. 创建数据库 `ry-nur` 并导入 `sql` 目录下的 SQL 脚本（如 `ry-nur.sql`）。
3. 修改 `smart-nursing-home-admin/src/main/resources/application-druid.yml` 中的数据库连接配置。
4. 运行 `smart-nursing-home-admin` 下的启动类 `SmartNursingHomeApplication` (假设类名)。

### 3. 前端启动
```bash
cd smart-nursing-home-ui
npm install
npm run dev
```

访问地址: http://localhost:80 (默认)

## 版权说明

本项目基于 RuoYi-Vue 二次开发。
