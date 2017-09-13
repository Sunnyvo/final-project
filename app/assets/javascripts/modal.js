
$(document).on("turbolinks:load",()=> {
  // display modal for creating a new idea
  $('.js-modal-background-new-idea, .js-modal-close-new-idea, .js-modal-button-new-idea').on('click', event => {
  $(".js-modal-new-idea").toggleClass('is-active');
  });

  $('.js-modal-join-idea,.js-send, .js-modal-background-join, .js-modal-close-join').on('click', event => {
    var id = $(event.target).parents(".card-show-idea").attr("id");
    $('#'+id).find('.js-modal-join').toggleClass('is-active');
  });


  $('.js-post').on('click', event =>{
    $(".js-modal-new-idea").toggleClass('is-active');
    var title = $(".js-modal-new-idea").find(".title-input").val();
    var need = $(".js-modal-new-idea").find(".need-input").val();
    var body = $(".js-modal-new-idea").find(".body-textarea").val();
    var category = $(".js-modal-new-idea").find("#idea_category_id option:selected").text()
    var cloned = $($(".card-show-idea")[0]).clone();
    cloned.find(".card-header-title a").text(title);
    cloned.find(".body p").text(body);
    cloned.find(".image-idea img").attr("src","");
    cloned.find(".subtitle small").text("less than a minute ago");
    cloned.find(".js-idea-category").text(category);
    cloned.find(".js-idea-need").text(need);
    cloned.find(".js-cmt-num .text-icon").text("0");
    cloned.find(".js-like-button .text-icon").text("0");
    cloned.find(".js-reach-num .text-icon").text("1");
    $(".ideas-list").prepend(cloned);

  });
});




