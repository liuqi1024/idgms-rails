# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140414073346) do

  create_table "game_groups", :force => true do |t|
    t.integer  "game_id"
    t.integer  "game_program_id"
    t.string   "code"
    t.string   "torrent"
    t.string   "serial_no"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "game_groups", ["game_id"], :name => "index_game_groups_on_game_id"

  create_table "game_programs", :force => true do |t|
    t.integer  "game_id"
    t.string   "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "game_programs", ["game_id"], :name => "index_game_programs_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "par_value"
    t.integer  "sub_gamesize"
    t.integer  "pool_size"
    t.integer  "pack_size"
    t.integer  "packs_per_pool"
    t.integer  "packs_per_carton"
    t.integer  "first_ticket_no"
    t.integer  "first_pack_no"
    t.integer  "first_pool_no"
    t.integer  "poolcount_per_printunit"
    t.integer  "random_no"
    t.integer  "current_pack_no"
    t.string   "version"
    t.string   "state"
    t.datetime "completed_at"
    t.text     "desc"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patches", :force => true do |t|
    t.string   "code"
    t.integer  "product_batch_id"
    t.integer  "ticket_count"
    t.string   "pack_no_totals"
    t.string   "progress"
    t.string   "progress_test"
    t.string   "state"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "patches", ["product_batch_id"], :name => "index_patches_on_product_batch_id"

  create_table "product_batches", :force => true do |t|
    t.integer  "game_id"
    t.integer  "worksheet_id"
    t.string   "code"
    t.string   "nation_code"
    t.string   "state"
    t.string   "progress"
    t.string   "progress_test"
    t.string   "progress_sample"
    t.integer  "ticket_count"
    t.integer  "print_unit_count"
    t.integer  "pool_count"
    t.integer  "subgame_count"
    t.integer  "start_pack_no"
    t.integer  "start_pool_no"
    t.integer  "start_subgame_no"
    t.integer  "output_pool_no_from"
    t.integer  "output_pool_no_to"
    t.string   "print_unit_totals"
    t.string   "print_unit_completes"
    t.datetime "completed_at"
    t.text     "desc"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "product_batches", ["worksheet_id"], :name => "index_product_batches_on_worksheet_id"

  create_table "product_units", :force => true do |t|
    t.integer  "game_id"
    t.integer  "product_batch_id"
    t.string   "code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "product_units", ["game_id"], :name => "index_product_units_on_game_id"
  add_index "product_units", ["product_batch_id"], :name => "index_product_units_on_product_batch_id"

  create_table "role_operations", :force => true do |t|
    t.integer  "role_id"
    t.integer  "operation_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "tickets", :force => true do |t|
    t.string   "ticket_no"
    t.integer  "game_id"
    t.integer  "game_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "tickets", ["game_group_id"], :name => "index_tickets_on_game_group_id"
  add_index "tickets", ["game_id"], :name => "index_tickets_on_game_id"

  create_table "transport_batches", :force => true do |t|
    t.integer  "product_batch_id"
    t.string   "code"
    t.integer  "start_pool_no"
    t.integer  "end_pool_no"
    t.string   "print_unit_completes"
    t.string   "state"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "transport_batches", ["product_batch_id"], :name => "index_transport_batches_on_product_batch_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "loginname"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["loginname"], :name => "index_users_on_loginname", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "worksheets", :force => true do |t|
    t.integer  "game_id"
    t.integer  "print_unit_count"
    t.integer  "ticket_count"
    t.string   "code"
    t.string   "printbatch"
    t.string   "version"
    t.datetime "generate_at"
    t.datetime "completed_at"
    t.string   "state"
    t.text     "desc"
    t.integer  "current_pack_no"
    t.integer  "current_pool_no"
    t.integer  "current_subgame_no"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "worksheets", ["game_id"], :name => "index_worksheets_on_game_id"

end
