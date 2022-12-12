import DKToast from 'vue-dk-toast';

let Notifier = DKToast

export default {
	install: (app) => {
		app.use(Notifier, {
            class: "m-notifier"
        })
	}
};