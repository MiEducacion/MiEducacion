<template>
  <TransitionRoot appear :show="isOpen" as="template">
    <Dialog as="div" @close="setIsOpen(false)" class="modal">
      <TransitionChild as="template" enter="duration-300 ease-out" enter-from="opacity-0" enter-to="opacity-100"
        leave="duration-200 ease-in" leave-from="opacity-100" leave-to="opacity-0">
        <div class="fixed inset-0 bg-black bg-opacity-25" />
      </TransitionChild>

      <div class="fixed inset-0 overflow-y-auto">
        <div class="flex min-h-full items-center justify-center p-4 text-center">
          <TransitionChild as="template" enter="duration-300 ease-out" enter-from="opacity-0 scale-95"
            enter-to="opacity-100 scale-100" leave="duration-200 ease-in" leave-from="opacity-100 scale-100"
            leave-to="opacity-0 scale-95">
            <DialogPanel
              class="dialog w-full max-w-md transform overflow-hidden rounded-2xl bg-white p-6 align-middle shadow-xl transition-all">
              <DialogTitle as="h3" class="text-lg text-center font-medium leading-6 text-gray-900" v-emoji>
                Create a course
              </DialogTitle>
              <img :src="CreateIllustration" class="illustration h-32" />
              <DialogDescription as="h3" v-emoji>
                Let's start! Fill in the details to create a course
              </DialogDescription>

              <div class="dialog container">
                <div class="create-course text-center">
                  <form ref="createCourse" @submit.prevent="createCourse">
                    <v-col cols="12" sm="10" class="mx-auto">
                      <m-input label="Course name" placeholder="My awesome course" type="name" required
                        v-model="course.name"/>

                      <v-combobox clearable filled multiple small-chips required v-model="course.teacher_ids"
                        label="Teachers" return-object></v-combobox>

                      <v-checkbox v-model="course.private" label="This course is private"></v-checkbox>
                    </v-col>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <button :loading="btnLoading" color="var(--m-primary)" dark elevation="0" type="submit">
                        Crear
                      </button>
                    </v-card-actions>
                  </form>
                </div>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>


<script setup>
import CreateIllustration from 'images/illustrations/create_illustration.png'
import { ref } from 'vue'
import {
  TransitionRoot,
  TransitionChild,
  Dialog,
  DialogPanel,
  DialogTitle,
  DialogDescription,
} from '@headlessui/vue'
import MInput from '../../forms/m-input.vue'
import { Unlock, Fingerprint } from 'lucide-vue-next';

const isOpen = ref(false)

function setIsOpen(value) {
  isOpen.value = value
}

defineExpose({
  setIsOpen
})




const show = {
  get() {
    return props.value
  },
  set(value) {
    this.$emit('input', value)
  }
}


</script>

<script>
export default {
  data() {
    return {
      btnLoading: null,
      course: {
        name: '',
        teacher_ids: [
          this.currentUser.id
        ],
        private: false
      }
    }
  },
  methods: {
    createCourse() {
      this.btnLoading = true
      let course = {
        name: this.course.name,
        teacher_ids: this.course.teacher_ids,
        private: this.course.private
      }
      axios.post('/courses/new.json', course)
        .then((response) => {
          this.btnLoading = false
          this.$router.push('/courses/' + response.data.course.id);
        })
        .catch((error) => {
          console.log(error)
          this.error = true
          this.btnLoading = false
        })
    }
  }
}</script>