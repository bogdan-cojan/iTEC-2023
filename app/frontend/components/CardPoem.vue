<template>
  <div class="card opacity-75 shadow-effect w-25 mb-4 scroll-props">
    <div class="card-header">
      {{ poem.title }}
    </div>
    <div class="card-body">
      <blockquote class="blockquote mb-0">
        <p class="mb-4" style="white-space: pre-line;">{{ poem.text }}</p>
        <footer class="blockquote-footer">by <cite title="Source Title">{{ poem.author }}</cite></footer>
      </blockquote>
    </div>
  </div>
</template>

<script>
export default {
  name: "CardPoem",
  props: ["poem"],
}
</script>

<style scoped>
.scroll-props {
  max-height: 400px;
  overflow-y: scroll;
}

.scroll-props::-webkit-scrollbar {
  width: 0;
  background: transparent;
}
</style>
