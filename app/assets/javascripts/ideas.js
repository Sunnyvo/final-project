$(document).on("turbolinks:load",()=> {
  $('.card-header-title a').on('click', function(e) {
    e.stopPropagation();
  });
  $('.js-idea-reach').on('click', function(e) {
    var reach = $(this);
    console.log("ajax is ready:", reach);
    var a = $(e.target).parents(".card-show-idea").attr("id").split("idea_").pop();
    e.preventDefault();
    $.ajax({
      type: "post",
      url: "/reaches",
      data: { reach: {idea_id: a} },
      dataType: 'json',
      success: function(data) { }
    });
  });
});
