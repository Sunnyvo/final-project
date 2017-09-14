$(document).on("turbolinks:load", setupInfiniteScroll)

function setupInfiniteScroll(e) {
a = window.location.href.match(/^.*\//);
b =  window.location.href;
if(a==b){
const THRESHOLD = 300;
  const $paginationElem = $('.pagination');
  const $window = $(window);
  const $document = $(document);
  const paginationUrl = $paginationElem.attr('data-pagination-endpoint');
  const pagesAmount = $paginationElem.attr('data-pagination-pages');
  let currentPage = 1;
  let baseEndpoint;

  /* validate if the pagination URL has query params */
  if (paginationUrl.indexOf('?') != -1) {
    baseEndpoint = paginationUrl + "&page=";
  } else {
    baseEndpoint = paginationUrl + "?page="
  }

  /* initialize pagination */
  $paginationElem.hide()
  let isPaginating = false

  /* listen to scrolling */
  $window.on('scroll', debounce(function () {
    console.log("scrolling", "current page: ", currentPage, "total pages: ", pagesAmount);
    if (!isPaginating && currentPage < pagesAmount && $window.scrollTop() > $document.height() - $window.height() - THRESHOLD) {
      isPaginating = true;
      currentPage++;
      $paginationElem.show();
      $.ajax({
        url: baseEndpoint + currentPage
      }).done(function (result) {
        $('.ideas-list').append(result);
        isPaginating = false;
      });
    }
    if (currentPage >= pagesAmount) {
      $paginationElem.hide();
    }
  }, 1000));
}
}

function debounce(func, wait, immediate) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        var later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};
