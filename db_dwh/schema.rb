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

ActiveRecord::Schema.define(version: 2020_10_20_174845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.date "customer_creation_date"
    t.string "company_name"
    t.string "company_contact_full_name"
    t.string "company_contact_email"
    t.integer "elevator_number"
    t.string "customer_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "contact_id"
    t.date "creation_date"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.string "serial_number"
    t.date "date_of_commissioning"
    t.integer "building_id"
    t.integer "customer_id"
    t.string "building_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quote_id"
    t.datetime "quote_created_at"
    t.string "company_name"
    t.string "email"
    t.integer "elevator_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
