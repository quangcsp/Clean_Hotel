// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.browser
//= require turbolinks
//= require medium-editor.min
//= require handlebars.runtime.min
//= require jquery-sortable-min
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery.fileupload
//= require medium-editor-insert-plugin.min
//= require vue.min
//= require vue-material
//= require vee-validate
//= require axios.min
//= require foxycomplete
//= require search
//= require_tree .

Vue.use(VeeValidate);
Vue.use(VueMaterial);
Vue.material.registerTheme({
    default: {
        primary: 'blue',
        accent: 'red',
        warn: 'orange',
        background: 'white',
    },
    yellow: {
        primary: 'yellow',
    },
});

$(function () {
    let token = document.getElementsByName('csrf-token')[0].getAttribute('content');
    axios.defaults.headers.common['X-CSRF-Token'] = token;
    axios.defaults.headers.common['Accept'] = 'application/json';
});
