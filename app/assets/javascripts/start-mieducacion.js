import(/* webpackChunkName: "mieducacion-app" */ './mieducacion/application').then(module => {
    const MiEducacion = module.default;
    MiEducacion.mount(document.getElementById("mieducacion"))
    window.MiEducacion = MiEducacion

    /* Require the Runtime Component compiler after MiEducacion is globally available */
    require('./mieducacion/lib/register-components')
   });

