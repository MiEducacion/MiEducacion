const PostComposer = {
    namespaced: true,
    state: {
        ComposerShow: false
    },
    mutations: {
        setComposerShow(state, value) {
            state.ComposerShow = value
        }
    },

};

export default PostComposer;