import $ from "jquery";

$(window).on('load', function () {
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
)