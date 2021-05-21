import $ from "jquery";

$(window).on('load', function () {
    let headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('.remove-from-admin').on('click', function (event) {
      updateUser(event.target.dataset.id, {role: 'user'}, headers)
    })

    $('.make-admin').on('click', function (event) {
      updateUser(event.target.dataset.id, {role: 'admin'}, headers)
    })

    $('.block-user').on('click', function (event) {
      updateUser(event.target.dataset.id, {enabled: false}, headers)
    })

    $('.unlock-user').on('click', function (event) {
      updateUser(event.target.dataset.id, {enabled: true}, headers)
    })
  }
)

function updateUser(id, data, headers) {
  console.log(id, data)
  $.ajax(`/admin/users/${id}.json`, {
    type: 'PUT',
    headers: headers,
    data: {user: data},
    success: function () {
      window.location.reload()
    }
  })
}
