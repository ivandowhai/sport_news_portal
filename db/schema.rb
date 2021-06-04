# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_02_073907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "survey_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_answers_on_survey_id"
  end

  create_table "answers_users", id: false, force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "article_views", force: :cascade do |t|
    t.bigint "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_views_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.string "image"
    t.string "video_link"
    t.string "caption"
    t.integer "views_count"
    t.integer "comments_count"
    t.bigint "team_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["team_id"], name: "index_articles_on_team_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "name"
    t.integer "status", limit: 2, default: 0
    t.string "image"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "closed_at", precision: 6, null: false
    t.index ["category_id"], name: "index_banners_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.boolean "enabled", default: false
    t.integer "priority", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count"
    t.integer "dislikes_count"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "code"
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "page_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.index ["name"], name: "index_page_categories_on_name", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.string "slug"
    t.text "body"
    t.integer "priority", default: 1
    t.bigint "page_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pages_on_name", unique: true
    t.index ["page_category_id"], name: "index_pages_on_page_category_id"
  end

  create_table "photo_of_the_days", force: :cascade do |t|
    t.string "picture"
    t.string "alt"
    t.string "title"
    t.string "description"
    t.string "author"
    t.boolean "show"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.boolean "like"
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_reactions_on_comment_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "site_settings", force: :cascade do |t|
    t.string "key"
    t.json "parameters"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "question"
    t.integer "status", default: 0
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "location"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.string "team"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_teams_on_category_id"
    t.index ["subcategory_id"], name: "index_teams_on_subcategory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "user"
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.boolean "enabled"
    t.boolean "online"
    t.string "subscription_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "teams", "categories", column: "subcategory_id"
end
