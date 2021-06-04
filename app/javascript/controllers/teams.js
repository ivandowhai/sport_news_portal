import $ from "jquery";

$(window).on('load', function () {
  const headers = {
    'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
  }

  $('#search_teams').on('keyup', function (event) {
    $.ajax('/teams-search', {
      data: {team: event.target.value},
      headers: headers,
      success: function (response) {
        let list = ''
        response.map(team => {
          list += `<div class="select-team" data-id="${team.id}">${team.team}</div>`
        })
        $('#teams_wrapper').html(list)

        $('.select-team').on('click', function (event) {
          console.log(`/teams/${event.target.dataset.id}/attach-to-user`)
          $('#teams_wrapper').html(`<div class="select-team">${event.target.innerHTML}</div>`)
          document.getElementById('attach_to_user_form').action = `/teams/${event.target.dataset.id}/attach-to-user`
          $('#search_teams').val(event.target.innerHTML)
        })
      }
    })
  })
})
