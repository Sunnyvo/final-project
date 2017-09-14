
$(document).on("turbolinks:load",()=> {
  $('#provider-remote').on('click', event => {
    event.stopPropagation();
    $("#list").fadeIn("fast");
  });
  $(document).on('click', e => {
    $('#list').hide();
  });
});

