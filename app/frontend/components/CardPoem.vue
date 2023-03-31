<template>
  <div class="card opacity-75 shadow-effect">
    <div class="card-header">
      {{ poem.title }}
    </div>
    <div class="card-body">
      <blockquote class="blockquote mb-0">
        <p>{{ poem.text }}</p>
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
