<template>
  <div class="website-layout">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'WebsiteLayout'
}
</script>

<style lang="scss" scoped>
.website-layout {
  min-height: 100vh;
  background: #f5f7fa;
}
</style>

