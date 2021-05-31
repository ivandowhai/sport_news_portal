import $ from "jquery";

$(window).on('load', function () {
  let headers = {
    'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
  }

  $('.nav-link').first().addClass('active')
  $('.tab-pane').first().addClass('active')

  $('.enable-element').on('click', function (event) {
    let url = event.target.checked
      ? `/admin/pages/enable/${event.target.dataset.id}`
      : `/admin/pages/disable/${event.target.dataset.id}`
    $.ajax({
      url: url,
      type: 'PUT',
      headers: headers
    })
  })

  $('.enable-category').on('click', function (event) {
    let url = event.target.checked
      ? `/admin/page_category/enable/${event.target.dataset.id}`
      : `/admin/page_category/disable/${event.target.dataset.id}`
    $.ajax({
      url: url,
      type: 'PUT',
      headers: headers
    })
  })

  $("#addFooterButton").on('click', function () {
    $('#category').val($('.nav-link.active')[0].dataset.category_id)
  })

  ClassicEditor
    .create( document.querySelector( '#page_body' ) )
    .catch( error => {
      console.error( error );
    } );
})
