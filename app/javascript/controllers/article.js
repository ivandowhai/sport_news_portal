import $ from "jquery";

$(window).on('load', function () {
    const headers = {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('#search').keypress(function (event) {
      if (event.originalEvent.key === 'Enter') {
        window.location.replace(encodeURI(`/search?query=${event.target.value}`))
      }
    })

    $('#comment_field').on('focus', function () {
      document.getElementById('cancel_button').hidden = false
    })

    $('.edit-comment').on('click', function (event) {
      const id = event.target.dataset.id
      $('#comment_field').val($(`#comment_${id}`).html())
      $('#edit_comment_url').val(event.delegateTarget.dataset.url)
      document.getElementById('cancel_button').hidden = false
    })

    $('#cancel_button').on('click', function () {
      $('#comment_field').val('')
      $('#edit_comment_url').val('')
      document.getElementById('cancel_button').hidden = true
    })

    $('#form').on('submit', function (event) {
      event.preventDefault()
      const url = $('#edit_comment_url').val()
      const params = {
        data: {
          comment: {comment: $('#comment_field').val()}
        },
        headers: headers,
        success: function (response) {
          window.location.reload()
        }
      }
      if (url) {
        params.url = url
        params.type = 'PUT'

      } else {
        params.url = event.target.action
        params.type = 'POST'
      }

      $.ajax(params)
    })

    $('.like').on('click', function (event) {
      $.ajax(makeParams(true, event.delegateTarget.dataset, headers))
    })

    $('.dislike').on('click', function (event) {
      $.ajax(makeParams(false, event.delegateTarget.dataset, headers))
    })
  }
)

function makeParams(reaction_type, options, headers) {
  const params = {
    headers: headers,
    success: function () {
      window.location.reload()
    }
  }

  if (options.reacted == 1) {
    params.type = 'DELETE'
    params.url = `/reactions/${options.reaction_id}`
  } else {
    params.type = 'POST'
    params.url = '/reactions'
    params.data = {
      reaction: {
        comment_id: options.comment_id,
        like: reaction_type
      }
    }
  }

  return params
}
