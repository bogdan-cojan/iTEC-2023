<template>
  <button @click="showColorPicker=true" type="button" class="btn btn-outline-primary shadow-effect">
    <i class="bi bi-palette me-2"></i>Change background color</button>
  <input type="color" v-if="showColorPicker" class="form-control form-control-color m-2 shadow-effect"
    v-model="selectedColor" @change="showColorPicker=false"/>
</template>

<script>
export default {
  name: "ColorPicker",
  data() {
    return {
      showColorPicker: false,
      selectedColor: '#000000',
    }
  },
  watch: {
    selectedColor(backgroundColor){
      this.$emit('bg-color-changed', backgroundColor);
    }
  }
}
</script>
