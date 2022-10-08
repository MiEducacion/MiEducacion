import { compile, h } from 'vue/dist/vue.esm-bundler'

document.querySelectorAll('script[type="text/x-m-component"]').forEach(function (component) {
    let name = component.dataset.componentName
    if (window.console) {
      window.console.log(
        "Detected x-m-component named: " + name
      );

      let compiledComponent = compile(component.innerHTML)
      MiEducacion.component(name, h(compiledComponent(MiEducacion)))
    }
  })
