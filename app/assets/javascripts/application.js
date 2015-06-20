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
//= require jquery-ui
//= require jquery_ujs
//= require_tree .


$(function() {
  $("#sortable").sortable({
    update : function() {
      var order = $("#sortable fields li input").sortable('serialize', {attribute: "order_number"});
      alert(order);
    }
  });
});

function hideDestroy(){
  $('.destroy-container').hide();
};

function removeItem(){
  $('.remove').on("click", function(){
    $(event.target).closest(".list-group-item").hide();
    var box = $(event.target).closest(".list-group-item").find(".task-destroy").get(0);
    //var boxj = $(event.target).closest(".list-group-item").find(".task-destroy");
    console.log(box);
    //box.prop("checked", true);
    box.checked = true;
    console.log(box);
    $(event.target).closest('form').submit();
  });

};

$(removeItem);
$(hideDestroy);
