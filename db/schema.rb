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

ActiveRecord::Schema[7.0].define(version: 2024_11_08_173405) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dietaries", force: :cascade do |t|
    t.string "dietary_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id", "favoritor_type", "favoritor_id", "scope"], name: "uniq_favorites__and_favoritables", unique: true
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_cuisines", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "cuisine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_recipe_cuisines_on_cuisine_id"
    t.index ["recipe_id"], name: "index_recipe_cuisines_on_recipe_id"
  end

  create_table "recipe_dietaries", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "dietary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dietary_id"], name: "index_recipe_dietaries_on_dietary_id"
    t.index ["recipe_id"], name: "index_recipe_dietaries_on_recipe_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "instruction"
    t.text "description"
    t.string "photo_url"
  end

  create_table "user_cuisines", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cuisine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuisine_id"], name: "index_user_cuisines_on_cuisine_id"
    t.index ["user_id"], name: "index_user_cuisines_on_user_id"
  end

  create_table "user_dietaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dietary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dietary_id"], name: "index_user_dietaries_on_dietary_id"
    t.index ["user_id"], name: "index_user_dietaries_on_user_id"
  end

  create_table "user_ingredients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_user_ingredients_on_ingredient_id"
    t.index ["user_id"], name: "index_user_ingredients_on_user_id"
  end

  create_table "user_times", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "max_cooking_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_times_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recipe_cuisines", "cuisines"
  add_foreign_key "recipe_cuisines", "recipes"
  add_foreign_key "recipe_dietaries", "dietaries"
  add_foreign_key "recipe_dietaries", "recipes"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "user_cuisines", "cuisines"
  add_foreign_key "user_cuisines", "users"
  add_foreign_key "user_dietaries", "dietaries"
  add_foreign_key "user_dietaries", "users"
  add_foreign_key "user_ingredients", "ingredients"
  add_foreign_key "user_ingredients", "users"
  add_foreign_key "user_times", "users"
end
