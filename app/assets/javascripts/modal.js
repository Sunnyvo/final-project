
$(document).on("turbolinks:load",()=> {
  $('.modal-background, .modal-close, .js-modal-button').on('click', event => {
    $(".modal").toggleClass('is-active');
  });
  $('.js-post').on('click', event =>{
    $(".modal").toggleClass('is-active');
    var title = $(".modal").find(".title-input").val();
    var body = $(".modal").find(".body-textarea").val();
    var cloned = $($(".js-idea")[0]).clone();
    cloned.find(".card-title strong p").text(title);
    cloned.find(".body p").text(body);
    cloned.find(".subtitle small").text("less than a minute ago");
    $(".ideas-list").prepend(cloned);
    $(".modal").find(".body-textarea").val("");
    $(".modal").find(".title-input").val("");
  });
});




