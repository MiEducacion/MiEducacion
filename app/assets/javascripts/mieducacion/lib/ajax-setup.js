import $ from 'jquery'

$.ajaxSetup({
    timeout: 10000,
    beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    },
    complete: function (xhr, status) {
        if (xhr.status === 200 || xhr.status === 422) {
            return true;
        }
        if (xhr.status === 404) {
            AppRouter.replace('/not-found')
        }
        if (xhr.status === 500 || xhr.status === 502) {
            AppRouter.replace('/exception')
        }
    }
})
window.$ = $
export default $