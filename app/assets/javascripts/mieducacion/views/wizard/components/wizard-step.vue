<template>
    <div>
      <router-view></router-view>
      <button @click="previousStep" v-show="currentStep > 0">Previous</button>
      <button @click="nextStep" v-show="currentStep < steps.length - 1">Next</button>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Wizard',
    data() {
      return {
        currentStep: 0,
        steps: [
          {
            path: '/step1'
          },
          {
            path: '/step2'
          },
          {
            path: '/step3'
          }
        ]
      }
    },
    methods: {
      nextStep() {
        this.currentStep++
        this.$router.push(this.steps[this.currentStep].path)
      },
      previousStep() {
        this.currentStep--
        this.$router.push(this.steps[this.currentStep].path)
      }
    }
  }
  </script>
  