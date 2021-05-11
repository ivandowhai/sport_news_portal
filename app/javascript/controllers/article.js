import $ from "jquery";

$(window).on('load', function () {
    const headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('#comment_field').on('focus', function () {
      document.getElementById('cancel_button').hidden = false
    })

    $('.edit-comment').on('click', function (event) {
      const id = event.target.dataset.id
      $('#comment_field').val($(`#comment_${id}`).html())
      $('#comment_id').val(id)
      document.getElementById('cancel_button').hidden = false
    })

    $('#cancel_button').on('click', function () {
      $('#comment_field').val('')
      $('#comment_id').val('')
      document.getElementById('cancel_button').hidden = true
    })

    $('#form').on('submit', function (event) {
      event.preventDefault()
      const id = $('#comment_id').val()
      const params = {
        data: {
          comment: {comment: $('#comment_field').val()}
        },
        headers: headers,
        success: function(response) {
          console.log(response)
          window.location.reload()
        }
      }
      if (id) {
        params.url = `/comment/${id}`
        params.type = 'PUT'

      } else {
        params.url = `/comment/${$('#article_id').val()}`
        params.type = 'POST'
      }

      $.ajax(params)
    })
  }
)
