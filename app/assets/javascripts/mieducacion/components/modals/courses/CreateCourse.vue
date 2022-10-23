<template>
  <TransitionRoot appear :show="isOpen" as="template">
    <Dialog as="div" @close="setIsOpen(false)" class="modal">
      <TransitionChild
        as="template"
        enter="duration-300 ease-out"
        enter-from="opacity-0"
        enter-to="opacity-100"
        leave="duration-200 ease-in"
        leave-from="opacity-100"
        leave-to="opacity-0"
      >
        <div class="fixed inset-0 bg-black bg-opacity-25" />
      </TransitionChild>

      <div class="fixed inset-0 overflow-y-auto">
        <div
          class="flex min-h-full items-center justify-center p-4 text-center"
        >
          <TransitionChild
            as="template"
            enter="duration-300 ease-out"
            enter-from="opacity-0 scale-95"
            enter-to="opacity-100 scale-100"
            leave="duration-200 ease-in"
            leave-from="opacity-100 scale-100"
            leave-to="opacity-0 scale-95"
          >
            <DialogPanel
              class="dialog w-full max-w-md transform overflow-hidden rounded-2xl bg-white p-6 align-middle shadow-xl transition-all"
            >
              <DialogTitle
                as="h3"
                class="text-lg text-center font-medium leading-6 text-gray-900"
                v-emoji
              >
              Create a course
              </DialogTitle>
                <img :src="CreateIllustration" class="illustration" />
              <DialogDescription as="h3" v-emoji>
                Let's start! Fill in the details to create a course
              </DialogDescription>

<v-container class="dialog">
      <div class="create-course text-center">
        <v-form ref="createCourse" lazy-validation @submit.prevent="createCourse()">
          <v-col cols="12" sm="10" class="mx-auto">
            <v-text-field
              label="Course name"
              placeholder="My awesome course"
              filled
              hide-details
              required
              class="mb-4"
              v-model="newCourse.name"
            ></v-text-field>

            <v-combobox
              clearable
              filled
              multiple
              small-chips
              required
              v-model="newCourse.teachers"
              label="Teachers"
              return-object
            ></v-combobox>

            <v-checkbox
              v-model="newCourse.private"
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
              type="submit"
            >
              Crear
            </v-btn>
          </v-card-actions>
        </v-form>
      </div>
    </v-container>   </DialogPanel>
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
import { Unlock, Fingerprint } from 'lucide-vue-next';

const isOpen = ref(false)

function setIsOpen(value) {
  isOpen.value = value
}

defineExpose({
  setIsOpen
})
</script>

<script>
export default {
  name: 'createCourseModal',
  props: {
     value: Boolean
  },
  data () {
    return {
        CreateIllustration,
        btnLoading : null,
        newCourse: {
          name : null,
          teachers : null,
          private : false,
        }
        
    }
  },
  mounted () {
  },
  methods: {
    createCourse() {
      this.$refs.createCourse.validate();
      this.btnLoading = true
      axios.post('/courses/new.json', this.newCourse)
      .then((response) => {
                  this.$emit('input', false)
                  this.$router.push('/courses/' + response.data.course.id);
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
