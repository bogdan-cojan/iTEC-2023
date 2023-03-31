<template>
  <button @click="$emit('get-poem')"
    type="button" class="btn btn-outline-primary mb-4 shadow-effect"
    ><i class="bi bi-chat-square-text-fill me-1"></i>
    Generate poem
  </button>
</template>

<script>
export default {
  name: "GenerateBtn",
}
</script>
