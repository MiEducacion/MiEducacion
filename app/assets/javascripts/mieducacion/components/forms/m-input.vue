<template>
  <input class="m-input" v-bind="$attrs" @input="updateValue" />
</template>
<script>
export default {
  props: {
    value: {
      type: [String, Number]
    }
  },
  setup(props, context) {
        const updateValue = (event) => {
            context.emit('update:modelValue', event.target.value);
        }

        return { updateValue }
    }
}
</script>