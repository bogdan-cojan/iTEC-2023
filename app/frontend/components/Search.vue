<template>
  <div class="form-floating mb-3 shadow-effect w-25">
    <input v-model.trim="searchTitle" @keyup.enter="onEnterKey()"
      class="form-control" id="floatingInput" placeholder="Search...">
    <label for="floatingInput"><i class="bi bi-search me-2"></i>Search...</label>
  </div>
</template>

<script>
export default {
  name: "Search",
  data() {
    return {
      searchTitle: "",
    }
  },
  methods: {
    onEnterKey() {
      this.$emit('search-poem', this.searchTitle);
      this.searchTitle = "";
    }
  }
}
</script>
