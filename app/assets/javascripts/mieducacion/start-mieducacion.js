import(/* webpackChunkName: "mieducacion-app" */ './mieducacion').then(module => {
    const MiEducacion = module.default;
    MiEducacion.mount(document.getElementById("mieducacion"))
    window.MiEducacion = MiEducacion

   });

