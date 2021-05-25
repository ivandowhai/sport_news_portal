import $ from "jquery";

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('.banner').on('click', function (event) {
      $.ajax({
        url: `/admin/banners/${event.target.dataset.action}/${event.target.dataset.id}`,
        method: 'PUT',
        headers: headers,
        success: function () {
          window.location.reload()
        }
      })
    })
  }
)
