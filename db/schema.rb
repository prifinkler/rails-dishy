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

ActiveRecord::Schema[7.0].define(version: 2023_09_02_111616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines_recipes", id: false, force: :cascade do |t|
    t.bigint "cuisine_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["cuisine_id", "recipe_id"], name: "index_cuisines_recipes_on_cuisine_id_and_recipe_id"
    t.index ["recipe_id", "cuisine_id"], name: "index_cuisines_recipes_on_recipe_id_and_cuisine_id"
  end

  create_table "cuisines_users", id: false, force: :cascade do |t|
    t.bigint "cuisine_id", null: false
    t.bigint "user_id", null: false
    t.index ["cuisine_id", "user_id"], name: "index_cuisines_users_on_cuisine_id_and_user_id"
    t.index ["user_id", "cuisine_id"], name: "index_cuisines_users_on_user_id_and_cuisine_id"
  end

  create_table "dietaries", force: :cascade do |t|
    t.string "dietary_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dietaries_recipes", id: false, force: :cascade do |t|
    t.bigint "dietary_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["dietary_id", "recipe_id"], name: "index_dietaries_recipes_on_dietary_id_and_recipe_id"
    t.index ["recipe_id", "dietary_id"], name: "index_dietaries_recipes_on_recipe_id_and_dietary_id"
  end

  create_table "dietaries_users", id: false, force: :cascade do |t|
    t.bigint "dietary_id", null: false
    t.bigint "user_id", null: false
    t.index ["dietary_id", "user_id"], name: "index_dietaries_users_on_dietary_id_and_user_id"
    t.index ["user_id", "dietary_id"], name: "index_dietaries_users_on_user_id_and_dietary_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["ingredient_id", "recipe_id"], name: "index_ingredients_recipes_on_ingredient_id_and_recipe_id"
    t.index ["recipe_id", "ingredient_id"], name: "index_ingredients_recipes_on_recipe_id_and_ingredient_id"
  end

  create_table "ingredients_users", id: false, force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "user_id", null: false
    t.index ["ingredient_id", "user_id"], name: "index_ingredients_users_on_ingredient_id_and_user_id"
    t.index ["user_id", "ingredient_id"], name: "index_ingredients_users_on_user_id_and_ingredient_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
