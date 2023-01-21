import { h, compile } from 'vue/dist/vue.esm-bundler'
import MiEducacion from '../application'

export function registerComponents() {
  // Buscamos todas las etiquetas <script> en la etiqueta <head> con el atributo type igual a "text/x-m-component"
  document.querySelectorAll('script[type="text/x-m-component"]').forEach(function (component) {
    console.log("Component", component.innerHTML)

    console.log(
      "Detected x-m-component named:", component.dataset.componentName
    );

    let name = component.dataset.componentName
    let outlet = component.dataset.pluginOutlet

    // Usamos una expresión regular para obtener la plantilla del componente
    const template = component.innerHTML.match(/<template>([\s\S]*)<\/template>/)[1]
    // Compilamos la plantilla
    try {
      const renderFunction = compile(template)
      MiEducacion.component(name, h(renderFunction))
      if(typeof MiEducacion._pluginComponents === "undefined") {
        MiEducacion._pluginComponents = []
      }
      MiEducacion._pluginComponents.push(name)


    }
    catch (e) {
      console.warn(`Ocurrió un error al compilar la plantilla "${name}"`, e)
    }

    // Registramos el componente en nuestra aplicación Vue
  })
}