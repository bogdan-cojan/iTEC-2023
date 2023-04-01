<template>
  <div class="card opacity-75 shadow-effect w-25 mb-4 scroll-props">
    <div class="card-header d-flex justify-content-between">
      {{ poem.title }}
      <button @click="speak(poem.title)" type="button" 
        class="btn btn-outline-primary btn-sm shadow-effect" title="Speak">
          <i class="bi bi-megaphone"></i></button>
    </div>
    <div class="card-body">
      <blockquote class="blockquote mb-0">
        <div class="d-flex justify-content-between">
          <p class="mb-4" style="white-space: pre-line;">{{ poem.text }}</p>
          <button @click="speak(poem.text)" type="button" 
            class="btn btn-outline-primary btn-sm h-25 shadow-effect" title="Speak">
              <i class="bi bi-megaphone"></i></button>
        </div>
        <footer class="blockquote-footer">by <cite title="Source Title">{{ poem.author }}</cite></footer>
      </blockquote>
    </div>
  </div>
</template>

<script>
export default {
  name: "CardPoem",
  props: ["poem"],
  methods: {
    speak(text) {
      var utterance = new SpeechSynthesisUtterance(text);
      window.speechSynthesis.speak(utterance);
      utterance = null;
    }
  },
  mounted() {
    window.addEventListener('beforeunload', () => {
      window.speechSynthesis.cancel();
    })
  },
  watch: {
    poem(nextPoem, previousPoem) {
      if (nextPoem !== previousPoem) {
        window.speechSynthesis.cancel();
      }
    }
  },
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
