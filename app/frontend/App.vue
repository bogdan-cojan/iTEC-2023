<template>
  <div class="app" :style="cssVars">
    <h2 class="text-danger-emphasis mb-4">iTEC_2023</h2>
    <Search @search-poem="searchPoem"/>
    <GenerateBtn @get-poem="fetchPoem()"/>
    <CardPoem v-if="poem" :poem="poem"/>
    <div class="position-absolute top-0 start-0 m-4">
      <ColorPicker @bg-color-changed="changeBgColor"/>
    </div>
  </div>

  <div class="toast align-items-center position-absolute top-0 end-0 m-4 shadow-effect" ref="toast"
    role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true">
    <div class="d-flex">
      <div class="toast-body">
        <i class="bi bi-exclamation-diamond text-danger me-2"></i>
        Poem not found.
      </div>
      <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</template>

<script>
import { Toast } from 'bootstrap';
import GenerateBtn from './components/GenerateBtn.vue';
import CardPoem from './components/CardPoem.vue';
import Search from './components/Search.vue';
import ColorPicker from './components/ColorPicker.vue';

export default {
  name: "App",
  components: {
    GenerateBtn,
    CardPoem,
    Search,
    ColorPicker
  },
  data() {
    return {
      poem: null,
      bgColor: 'whitesmoke',
    };
  },
  methods: {
    changeBgColor(backgroundColor) {
      this.bgColor = backgroundColor;
    },

    async fetchPoem() {
      await fetch("/apis/v1/generate/poems")
        .then((response) => response.json())
        .then((data) => this.poem = data);
    },

    async searchPoem(searchTitle) {
      await fetch("/apis/v1/search/poems?title=" + searchTitle)
        .then((response) => response.json())
        .then((data) => this.poem = data)
        .catch(() => {
          const toastBootstrap = new Toast(this.$refs.toast);
          toastBootstrap.show();
        })
    },
  },
  computed: {
    cssVars() {
      return {
        '--bg-color': this.bgColor
      }
    }
  }
};
</script>

<style>
.app {
  background-color: var(--bg-color);
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
