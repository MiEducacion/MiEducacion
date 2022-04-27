import Vue from 'vue'
import Vuex from 'vuex'
import PostComposer from './PostComposer';
Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    PostComposer
  }
});

export default store;