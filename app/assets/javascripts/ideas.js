$(document).on("turbolinks:load",()=> {
  $('.js-idea').delegate('div', 'click', function(e) {
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
