
$(document).on("turbolinks:load",()=> {
  $('.js-modal-button, .modal-background, .modal-close ').on('click', event => {
    $(".modal").toggleClass('is-active');
  });
}
);




