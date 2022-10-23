import { defineStore } from 'pinia'

export const currentUser = defineStore('currentUser', {
  id: 'currentUserStore',
  state: () =>({

  }),
  getters: {

  },
  actions:{
    setCurrentUser(user) {
      this.$state = user
    }
  }
})