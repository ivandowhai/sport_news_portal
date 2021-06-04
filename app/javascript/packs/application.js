// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "@ckeditor/ckeditor5-build-classic/build/ckeditor.js"
import "../../assets/stylesheets/application.scss"
import "../controllers/admin/footer"
import "../controllers/admin/locales"
import "../controllers/admin/home"
import "../controllers/admin/users"
import "../controllers/admin/banners"
import "../controllers/admin/surveys"
import "../controllers/admin/article"
import "../controllers/admin/teams"
import "../controllers/application"
import "../controllers/article"
import "../controllers/surveys"
import "../controllers/teams"

Rails.start()
ActiveStorage.start()
