import $ from "jquery";

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('#add-answer').on('click', function () {
      $('#answers').append('<div class="form-group"><input type="text" name="survey[answers][]" class="form-control"></div>')
    })

  $('.survey').on('click', function (event) {
    $.ajax({
      url: `/admin/surveys/${event.target.dataset.action}/${event.target.dataset.id}`,
      method: 'PUT',
      headers: headers,
      success: function () {
        window.location.reload()
      }
    })
  })
  }
)
