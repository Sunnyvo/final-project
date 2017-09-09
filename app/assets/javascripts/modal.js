
$(document).on("turbolinks:load",()=> {
  $('.modal-background, .modal-close, .js-modal-button').on('click', event => {
    $(".modal").toggleClass('is-active');
  });
  $('.js-post').on('click', event =>{
    $(".modal").toggleClass('is-active');
    var title = $(".modal").find(".title-input").val();
    var need = $(".modal").find(".need-input").val();
    var body = $(".modal").find(".body-textarea").val();
    var category = $(".modal").find("#idea_category_id option:selected").text()
    var cloned = $($(".card-show-idea")[0]).clone();
    cloned.find("h3 strong p").text(title);
    cloned.find(".body p").text(body);
    cloned.find(".image-idea img").attr("src","");
    cloned.find(".subtitle small").text("less than a minute ago");
    cloned.find(".js-idea-category").text(category);
    cloned.find(".js-idea-need").text(need);
    $(".ideas-list").prepend(cloned);

  });
});




