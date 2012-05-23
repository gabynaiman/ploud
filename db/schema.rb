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

ActiveRecord::Schema.define(:version => 20120522233600) do

  create_table "contexts", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
  end

  create_table "task_statuses", :force => true do |t|
    t.string   "name",                            :null => false
    t.integer  "workspace_id",                    :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "created_by",                      :null => false
    t.integer  "updated_by",                      :null => false
    t.boolean  "todo",         :default => false, :null => false
  end

  add_index "task_statuses", ["workspace_id"], :name => "index_task_statuses_on_workspace_id"

  create_table "tasks", :force => true do |t|
    t.string   "name",           :null => false
    t.text     "description"
    t.integer  "workspace_id"
    t.integer  "task_status_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "created_by",     :null => false
    t.integer  "updated_by",     :null => false
    t.integer  "priority"
  end

  add_index "tasks", ["task_status_id"], :name => "index_tasks_on_task_status_id"
  add_index "tasks", ["workspace_id"], :name => "index_tasks_on_workspace_id"

  create_table "users", :force => true do |t|
    t.string    "name",                   :default => "", :null => false
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.integer   "failed_attempts",        :default => 0
    t.string    "unlock_token"
    t.timestamp "locked_at"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "workspaces", :force => true do |t|
    t.string   "name",              :null => false
    t.integer  "context_id",        :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "created_by",        :null => false
    t.integer  "updated_by",        :null => false
    t.integer  "default_status_id"
  end

  add_index "workspaces", ["context_id"], :name => "index_workspaces_on_context_id"

end
