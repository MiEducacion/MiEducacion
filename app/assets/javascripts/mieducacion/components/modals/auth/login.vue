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
              class="dialog login w-full max-w-md transform overflow-hidden rounded-2xl bg-white p-6 text-left align-middle shadow-xl transition-all">
              <div class="image-container justify-center flex pb-4">
                <img :src="SiteSettings.site_logo" class="modal-site-logo" />
              </div>
              <DialogTitle as="h3" class="text-lg font-medium leading-6 text-gray-900" v-emoji>
                Welcome back to {{ SiteSettings.site_name }} 👋!
              </DialogTitle>
              <div class="mt-2">
                <p class="text-sm text-gray-500 mb-4">
                  Ready to go back to school?
                </p>

                <form id="login-form" @submit="console.log(e)" type="POST">
                  <m-input type="email" v-model="email" id="login-email-input" placeholder="E-mail" class="mb-4" />
                  <m-input type="password" v-model="password" id="login-password-input" placeholder="Password" />

                  <div class="mt-4">
                    <a @click="forgotPassword" class="forgot-password">Forgot password</a>
                    <button type="submit" class="login-button" @click="submitLogin">
                      <template v-if="loading">
                        <LoadingIcon :size="18" class="icon loading-request" />
                      </template>
                      <template v-else>
                        <Unlock :size="18" class="icon" />
                      </template>
                      Login
                    </button>
                    <footer v-if="SiteSettings.enable_cas_login || SiteSettings.enable_oauth_login">
                      <hr class="separator" />
                      <div class="external-auth-providers">
                        <a @click="casLogin" :class="`auth-provider`" v-if="SiteSettings.enable_cas_login">
                          <Fingerprint class="icon" :size="20" />Login with CAS
                        </a>
                      </div>
                    </footer>
                  </div>
                </form>
              </div>
            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script setup>
import { ref } from 'vue'
import {
  TransitionRoot,
  TransitionChild,
  Dialog,
  DialogPanel,
  DialogTitle,
  DialogDescription,
} from '@headlessui/vue'
import { Unlock, Fingerprint } from 'lucide-vue-next'
import mInput from '../../forms/m-input.vue';

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
  data() {
    return {
      email: null,
      password: null,
      remember_me: null,
      loading: false
    }
  },
  methods: {
    submitLogin(e) {
      e.preventDefault()
      this.loading = true
      axios.post('/users/sign_in.json', {
        user: {
          email: this.email,
          password: this.password
        }
      })
        .then(res => {
          this.loading = false
          window.location.reload()
        })
        .catch(e => {
          this.loading = false;
          console.error(e)
        })
    },
    forgotPassword(e) {
      e.preventDefault()
    }
  }
}
</script>
