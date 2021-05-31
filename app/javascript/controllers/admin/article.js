import $ from "jquery";

$(window).on('load', function () {
    ClassicEditor
      .create(document.querySelector('#article_body'))
      .catch(error => {
        console.error(error);
      });
  }
)