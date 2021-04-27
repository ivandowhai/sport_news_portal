import $ from "jquery";

$(window).on('load', function () {
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
        $('#category').val($('.tab-pane.active')[0].id)
    })
})
