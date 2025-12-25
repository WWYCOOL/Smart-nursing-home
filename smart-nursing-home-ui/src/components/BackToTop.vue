<template>
  <transition name="fade">
    <el-tooltip 
      v-show="visible"
      content="返回顶部" 
      placement="left"
      effect="dark"
    >
      <div 
        class="back-to-top"
        @click="scrollToTop"
      >
        <i class="el-icon-top"></i>
      </div>
    </el-tooltip>
  </transition>
</template>

<script>
export default {
  name: 'BackToTop',
  data() {
    return {
      visible: false
    }
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll)
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      this.visible = window.pageYOffset > 300
    },
    scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.back-to-top {
  position: fixed;
  right: 30px;
  bottom: 50px;
  width: 50px;
  height: 50px;
  background: #3498db;
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
  transition: all 0.3s ease;
  z-index: 1000;
  animation: bounceIn 0.6s ease-out;

  &:hover {
    background: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(52, 152, 219, 0.4);
  }

  &:active {
    transform: translateY(0) scale(0.95);
  }

  i {
    font-size: 20px;
  }
}

@keyframes bounceIn {
  0% {
    opacity: 0;
    transform: scale(0.3);
  }
  50% {
    opacity: 1;
    transform: scale(1.05);
  }
  70% {
    transform: scale(0.9);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter, .fade-leave-to {
  opacity: 0;
}

// 响应式设计
@media (max-width: 768px) {
  .back-to-top {
    right: 20px;
    bottom: 30px;
    width: 45px;
    height: 45px;

    i {
      font-size: 18px;
    }
  }
}
</style>
