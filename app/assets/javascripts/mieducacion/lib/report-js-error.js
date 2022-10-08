/* This handler will report JavaScript errors to
Logster gem, so they are accessible from "/logs" */

var lastReport = null;

if (!window.Logster) {
	window.Logster = {
		enabled: true
	};
}

function logsterHandler(err, severity, enableReportToLogster) {
	if (severity === 'error') {
		console.error(err)
	} else {
		console.warn(err)
	}

	if (lastReport && new Date() - lastReport < 1000 * 60) {
		return;
	}
	if (!Logster.enabled) {
		return;
	}

	lastReport = new Date();
	var reportData = {
		message: err.name,
		url: window.AppRouter.currentRoute.path,
		window_location: window.location && (window.location + ""),
		stacktrace: err.stack,
		severity: 'error'
	}

	if (process.env.NODE_ENV !== 'development' && enableReportToLogster) {
		axios.post("/logs/report_js_error",
			reportData
		);
	}
}

export default {
	install: (app) => {
		app.config.errorHandler = function(err, vm, info) {
			logsterHandler(err, 'error', app.$Site.enableReportToLogster)
		};

		app.config.warnHandler = function(err, vm, info) {
			logsterHandler(err, 'warning', app.$Site.enableReportToLogster)
		};

	}
};