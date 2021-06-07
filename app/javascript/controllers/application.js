import $ from "jquery";

$(window).on('load', function () {
    const headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    if (document.getElementById('survey-place').dataset.show == 'true') {
      $.ajax('/survey/show_newest', {
        headers: headers,
        success: function (data) {
          $('#survey-place').html(data)
        }
      })
    }

  if (document.getElementById('banner-place')) {
    const categoryId = document.getElementById('category_id').dataset.category_id
    $.ajax(`/categories/${categoryId}/banners`, {
      headers: headers,
      success: function (data) {
        $('#banner-place').html(data)
      }
    })
  }
  }
)
