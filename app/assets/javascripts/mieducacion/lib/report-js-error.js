/* This handler will report JavaScript errors to
Logster gem, so they are accessible from "/logs" */
import Vue from "vue";

var lastReport = null;

if (!window.Logster) {
    window.Logster = {
        enabled: true
    };
}

Vue.config.errorHandler = function(err, vm, info) {
    console.error(err)

    if (lastReport && new Date() - lastReport < 1000 * 60) {
        return;
    }
    if (!Logster.enabled) {
        return;
    }

    lastReport = new Date();
    var data = {
        message: err,
        url: window.AppRouter.currentRoute.path,
        window_location: window.location && (window.location + ""),
        stacktrace: info
    }

    $.ajax("/logs/report_js_error", {
        data: data,
        type: "POST",
        cache: false
    });
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
    var data = {
        message: err,
        url: window.AppRouter.currentRoute.path,
        window_location: window.location && (window.location + ""),
        stacktrace: info
    }

    $.ajax("/logs/report_js_error", {
        data: data,
        type: "POST",
        cache: false
    });
};