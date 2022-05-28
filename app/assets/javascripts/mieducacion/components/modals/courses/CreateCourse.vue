<template>
<v-dialog v-model="show" max-width="500px" transition="scroll-y-transition">
    <v-container class="dialog">
        <div class="create-course text-center">
    <v-card-title class="title">Create a course</v-card-title>
    <img :src="CreateIllustration" class="illustration">
    <p class="group-title">
        Let's start! Fill in the details to create a course
    </p>
    <v-col
          cols="12"
          sm="10" class="mx-auto"
        >
          <v-text-field
            label="Course name"
            placeholder="My awesome course"
            filled
            hide-details
            class="mb-4"
          ></v-text-field>

          <v-combobox
  clearable
  filled
  multiple
  small-chips
  label="Teachers"
></v-combobox>

<v-checkbox
      v-model="privateCourse"
      label="This course is private"
    ></v-checkbox>
        </v-col>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
             :loading="btnLoading"
             color="var(--mieducacion-primary)"
             dark
             elevation="0"
             @click="createCourse()">
                Crear
            </v-btn>
        </v-card-actions>
        </div>
    </v-container>
</v-dialog>
</template>

<script>
import CreateIllustration from 'images/illustrations/create_illustration.png'
export default {
  name: 'createCourseModal',
  props: {
     value: Boolean
  },
  data () {
    return {
        CreateIllustration,
        privateCourse : false,
        btnLoading : null
    }
  },
  mounted () {
  },
  methods: {
    createCourse() {
      this.btnLoading = true
      $.post('/courses/new')
      .then((response) => {
                    this.response = response
                })
                .catch((error) => {
                    console.log(error)
                    this.error = true
                    this.btnLoading = false
                })
    }
  },
  computed: {
    show: {
      get () {
        return this.value
      },
      set (value) {
         this.$emit('input', value)
      }
    }
  },
watch: {
    show(visible) {
      if (visible) {
        this.response = null
      } else {
      }
    }
  },
}
</script>