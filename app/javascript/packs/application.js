// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../../assets/stylesheets/application.scss"
import "../controllers/admin/footer"
import "../controllers/admin/locales"
import "../controllers/admin/home"
import "../controllers/admin/users"
import "../controllers/admin/banners"
import "../controllers/admin/surveys"
import "../controllers/article"
import "../controllers/surveys"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
