# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_27_173627) do

  create_table "assistance_packages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "ap_index", unique: true
  end

  create_table "assistance_packages_assistances", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "assistance_package_id", null: false
    t.bigint "assistance_id", null: false
    t.index ["assistance_package_id", "assistance_id"], name: "apa_index", unique: true
  end

  create_table "assistance_packages_quotes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "assistance_package_id", null: false
    t.index ["assistance_package_id", "quote_id"], name: "apq_index", unique: true
  end

  create_table "assistances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description", limit: 500, null: false
    t.integer "limit_use"
    t.boolean "included"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "a_index", unique: true
  end

  create_table "assistances_quotes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "assistance_id", null: false
    t.index ["assistance_id", "quote_id"], name: "aq_index", unique: true
  end

  create_table "category_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "cp_index", unique: true
  end

  create_table "category_properties_quotes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "category_property_id", null: false
    t.index ["category_property_id", "quote_id"], name: "cpq_index", unique: true
  end

  create_table "coverages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.boolean "fix", default: false, null: false
    t.decimal "value", precision: 10, scale: 2, null: false
    t.decimal "franchise", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 100
    t.string "description", limit: 500
    t.index ["name"], name: "c_index", unique: true
  end

  create_table "coverages_quotes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "coverage_id", null: false
    t.index ["coverage_id", "quote_id"], name: "cq_index", unique: true
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "email", limit: 50
    t.string "phone", limit: 11
    t.string "zipcode", limit: 8, null: false
    t.string "type_of_property", limit: 1, null: false
    t.boolean "gated_community", null: false
    t.boolean "main_home", null: false
    t.decimal "approximate_value", precision: 10, scale: 2, null: false
    t.boolean "insurance_with_another_insurer", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calculate_for_years"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.index ["name"], name: "q_index", unique: true
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_login"
    t.index ["email"], name: "u_index", unique: true
  end

  add_foreign_key "quotes", "users"
end
