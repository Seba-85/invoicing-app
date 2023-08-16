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

ActiveRecord::Schema[7.0].define(version: 2023_08_16_160316) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "owner_name"
    t.string "owner_last_name"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "tax_number"
    t.string "regon"
    t.string "email"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "owner_name"
    t.string "owner_last_name"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "tax_number"
    t.string "regon"
    t.string "phone_number"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "place_of_issue"
    t.date "date_of_issue"
    t.date "date_of_payment"
    t.string "product_name"
    t.string "unit"
    t.integer "net_price"
    t.integer "net_value"
    t.integer "vat_rate"
    t.integer "amount_of_vat"
    t.integer "gross_value"
    t.integer "quantity"
    t.integer "user_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "users"
end
