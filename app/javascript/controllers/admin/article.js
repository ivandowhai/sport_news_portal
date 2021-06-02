import $ from "jquery";

$(window).on('load', function () {
    if ($('#article_body')) {
      ClassicEditor
        .create(document.querySelector('#article_body'), {
          removePlugins: [
            'CKFinder',
            'Image',
            'ImageCaption',
            'ImageStyle',
            'ImageToolbar',
            'ImageUpload',
            'Table',
            'TableToolbar',
            'EasyImage'
          ]
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
)