import $ from "jquery";

$(window).on('load', function () {
    let headers = {
        'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content
    }

    $('.nav-link').first().addClass('active')
    $('.tab-pane').first().addClass('active')

    $('.enable-element').on('click', function (event) {
        $.ajax({
            url: `/admin/pages/enable/${event.target.dataset.id}`,
            type: 'PUT',
            data: { enabled: event.target.checked },
            headers: headers
        })
    })

    $('.enable-category').on('click', function (event) {
        $.ajax({
            url: `/admin/pages/enable_category/${event.target.dataset.id}`,
            type: 'PUT',
            data: { enabled: event.target.checked },
            headers: headers
        })
    })

    $("#addFooterButton").on('click', function () {
        $('#category').val($('.nav-link.active')[0].dataset.category_id)
    })
})
