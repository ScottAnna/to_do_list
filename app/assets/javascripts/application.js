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
    update: function(event, ui) {
        $('.orderNum').each(function(i) {
           $(this).val(i + 1);
           $.ajax({
                   type: 'PATCH',
                   url: '/lists/1/update',
                   dataType: 'json',
                   data: { task: { order_number: order_number } }
                 });
        });
    }
  });
});



function hideDestroy(){
  $('.destroy-container').hide();
};

function removeItem(){
  $('.remove').on("click", function(){
    $(event.target).closest(".list-group-item").hide();
    var box = $(event.target).closest(".list-group-item").find(".task-destroy")
    box.prop("checked", "true");
    $(this).closest('form').submit();
  });

};

function hideDelete() {
  $('.delete-button').on("click", function() {
    $(this).closest('li').fadeOut(500);
  })
}

$(hideDelete)
$(removeItem);
$(hideDestroy);
