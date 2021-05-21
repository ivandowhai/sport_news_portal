import $ from "jquery";

$(window).on('load', function () {
  let headers = {
    'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
  }

  $('.enable').on('click', function (event) {
    $.ajax({
      url: `/admin/settings/${event.target.dataset.key}`,
      type: 'PUT',
      headers: headers,
      data: {enabled: event.target.checked}
    })
  })

  $('#most_popular').on('change', function (event) {
    changePeriod('most_popular', event.target.value, headers)
  })

  $('#most_commented').on('change', function (event) {
    changePeriod('most_commented', event.target.value, headers)
  })
})

function changePeriod(key, period, headers) {
  $.ajax({
    url: `/admin/settings/${key}`,
    type: 'PUT',
    headers: headers,
    data: {period: period}
  })
}
