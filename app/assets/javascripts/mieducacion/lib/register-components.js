/* TODO: Register the components that are in head tag so that they are available in the app */
$('script[type="text/x-template"]').each(function () {
    let $this = $(this);
    let name = $this.attr("name") || $this.data("template-name");

    if (window.console) {
      window.console.log(
        "Detected x-template named: " + name
      );
    }
    /* At the moment we eliminate them until we discover the method to register them */
    $this.remove();
  });