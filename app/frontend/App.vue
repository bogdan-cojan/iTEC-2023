<template>
  <div class="app">
    <h2 class="text-danger-emphasis mb-4">iTEC_2023</h2>
    <GenerateBtn @get-poem="fetchPoem()"/>
    <CardPoem v-if="poem" :poem="poem"/>
  </div>
</template>

<script>
import GenerateBtn from './components/GenerateBtn.vue';
import CardPoem from './components/CardPoem.vue';

export default {
  name: "App",
  components: {
    GenerateBtn,
    CardPoem,
  },
  data() {
    return {
      poem: null,
    };
  },
  methods: {
    async fetchPoem() {
      await fetch("/apis/v1/poem")
        .then((response) => response.json())
        .then((data) => this.poem = data);
    }
  }
};
</script>

<style>
.app {
  background-color: whitesmoke;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.shadow-effect {
  box-shadow: 4px 4px 5px rgb(125, 203, 229);
}
</style>
