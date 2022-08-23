<template>
 <Menu as="div" class="relative inline-block text-left"
    v-if="currentUser">
    <MenuButton id="current-user">
          
        {{ currentUser.email }}
    </MenuButton>

    <!-- Use Vue's built-in <transition> element to add transitions. -->
    <transition
      enter-active-class="transition duration-100 ease-out"
      enter-from-class="transform scale-95 opacity-0"
      enter-to-class="transform scale-100 opacity-100"
      leave-active-class="transition duration-75 ease-out"
      leave-from-class="transform scale-100 opacity-100"
      leave-to-class="transform scale-95 opacity-0"
    >
      <MenuItems          
      class="user-menu-items">
      <div class="py-1">
        <MenuItem v-slot="{ active }" as="li">
        <a class="menu-item" :class='{ "bg-purple-500": active }' href="/account-settings">
          Account settings
        </a>
      </MenuItem>

      <MenuItem as="li">
        <button @click="userLogout()" id="logout-button" class="menu-item">Logout</button>
      </MenuItem>
      </div>

        <!-- ... -->
      </MenuItems>
    </transition>
  </Menu>
  <btn v-else @click="openLoginModal()" class="login-button flex" href="/users/sign_in">
  <LoginModal ref="loginModal" />
    <UserIcon :size="18" class="mr-2" />
    Login
  </btn>
</template>

<script setup>
  import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
</script>

<script> 
import LoginModal from './modals/auth/login'
import { User as UserIcon } from 'lucide-vue-next'

export default {
  components: {
    LoginModal,
    UserIcon
  },
    methods: {
        userLogout() {
            axios.delete('/users/sign_out', {
              headers: {
                Accept: 'application/json'
              }
            })
            .then(() => {
                window.location.href = "/"
            })
        },
        openLoginModal() {
        this.$refs.loginModal.setIsOpen(true);
      }
    }
}
</script>