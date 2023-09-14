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

ActiveRecord::Schema[7.0].define(version: 2023_09_14_032624) do
  create_table "favs", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_favs_on_movie_id"
    t.index ["user_id"], name: "index_favs_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genrizations", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genrizations_on_genre_id"
    t.index ["movie_id"], name: "index_genrizations_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.decimal "total_gross"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.date "released_on"
    t.string "poster_file_name", default: "placeholder.png"
    t.string "slug"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "stars"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "favs", "movies"
  add_foreign_key "favs", "users"
  add_foreign_key "genrizations", "genres"
  add_foreign_key "genrizations", "movies"
  add_foreign_key "reviews", "movies"
end