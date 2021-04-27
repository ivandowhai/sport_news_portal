import $ from "jquery";

$(window).on('load', function () {
    $('.nav-link').first().addClass('active')
    $('.tab-pane').first().addClass('active')

    $('.enable-element').on('click', function (event) {
        $.ajax({
            url: `/admin/pages/enable/${event.target.dataset.id}`,
            type: 'PUT',
            data: { enabled: event.target.checked },
            headers: {
                'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
            },
            success: function (response) {
                console.log(response)
            }
        })
    })

    $("#addFooterButton").on('click', function () {
        $('#category').val($('.nav-link.active')[0].dataset.category_id)
    })
})
