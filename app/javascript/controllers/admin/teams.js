import $ from "jquery";

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('#category_select').on('change', function (event) {
      $.ajax(`/admin/categories/${event.target.value}/subcategories`, {
        headers: headers,
        success: function (data) {
          refreshSubcategoriesList(data)
        }
      })
    })
  }
)

function refreshSubcategoriesList(list) {
  let options = ''
  list.map(category => {
    options += `<option value="${category.id}">${category.name}</option>`
  })
  $('#subcategory_select').html(options)
}
