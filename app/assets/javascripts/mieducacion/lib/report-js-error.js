/* This handler will report JavaScript errors to
Logster gem, so they are accessible from "/logs" */

var lastReport = null;

if (!window.Logster) {
    window.Logster = {
        enabled: true
    };
}/* 

Vue.config.errorHandler = function(err, vm, info) {
    console.error(err)

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

    axios.post("/logs/report_js_error",
        reportData
    );
};


Vue.config.warnHandler = function(err, vm, info) {
    console.warn(err)

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
        severity: 'warning'
    }

    axios.post("/logs/report_js_error",
        reportData
    );
}; */