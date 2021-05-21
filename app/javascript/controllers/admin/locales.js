import $ from "jquery";

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('.enable-element').on('click', function (event) {
      let url = event.target.checked
        ? `/admin/locales/enable/${event.target.dataset.id}`
        : `/admin/locales/disable/${event.target.dataset.id}`
      $.ajax({
        url: url,
        type: 'PUT',
        headers: headers
      })
    })
  }
)
