Shiny.addCustomMessageHandler(
  'open_tab_js',
  function(x_tab) {
    console.log(x_tab);
    $('a', $('.nav')).each(
      function() {
        if (this.getAttribute('data-value') == x_tab) { this.click() }
      }
    );
  }
);
