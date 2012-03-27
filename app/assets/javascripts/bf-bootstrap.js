;(function() {
  var templates = {
    form: '\
      <form class="well">{{fieldsets}}</form>\
    ',

    fieldset: '\
      <fieldset>\
        {{legend}}\
        {{fields}}\
      </fieldset>\
    ',

    field: '\
      <div class="control-group">\
        <label class="control-label" for="{{id}}">{{title}}</label>\
        <div class="controls">\
          <div class="input-xlarge">{{editor}}</div>\
          <div class="help-block">{{help}}</div>\
        </div>\
      </div>\
    ',

    pagedown: '\
      <div class="wmd-panel">\
        <div id="wmd-button-bar"></div>\
        <textarea class="wmd-input" id="wmd-input"></textarea>\
      </div>\
      <div id="wmd-preview" class="wmd-panel wmd-preview"></div>\
    '
  };
  
  var classNames = {
    error: 'error'
  };

  Backbone.Form.helpers.setTemplates(templates, classNames);
})();
