import $ from "jquery";

$(window).on('load', function () {
  const headers = {
    'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
  }

  $('#search-survey').keypress(function (event) {
    if (event.originalEvent.key === 'Enter') {
      window.location.replace(encodeURI(`/surveys?search=${event.target.value}`))
    }
  })

  $('.survey-open').on('click', function (event) {
    get_survey(event.target.dataset.id);
  })

  function get_survey(id) {
    $.ajax(`/surveys/${id}`, {
      headers: headers,
      success: function (data) {
        $('#survey-place').html(data)
      }
    })
  }
})
