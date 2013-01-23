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

ActiveRecord::Schema.define(:version => 20130123210439) do

  create_table "article_histories", :force => true do |t|
    t.string   "title"
    t.string   "alternate_title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title",                              :null => false
    t.string   "alternate_title"
    t.text     "content"
    t.boolean  "enabled",         :default => true
    t.boolean  "isfrozen",        :default => false
    t.boolean  "reviseme",        :default => false
    t.boolean  "unreleased",      :default => false
    t.boolean  "allowuploads",    :default => true
    t.boolean  "hasftp",          :default => false
    t.string   "releasedate"
    t.string   "changelog"
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "attachments", :force => true do |t|
    t.integer  "article_id"
    t.string   "description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachfile_file_name"
    t.string   "attachfile_content_type"
    t.integer  "attachfile_file_size"
    t.datetime "attachfile_updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "article_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title",                              :null => false
    t.string   "alternate_title"
    t.text     "content"
    t.boolean  "enabled",         :default => true
    t.boolean  "isfrozen",        :default => false
    t.boolean  "reviseme",        :default => false
    t.boolean  "unreleased",      :default => false
    t.boolean  "allowuploads",    :default => true
    t.boolean  "hasftp",          :default => false
    t.string   "releasedate"
    t.string   "changelog"
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "node_images", :force => true do |t|
    t.string   "description"
    t.integer  "article_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "active",                :default => true
    t.string   "old_password_hash"
    t.string   "password_digest"
    t.text     "signature"
    t.string   "jabber"
    t.string   "icq"
    t.string   "twitter"
    t.string   "homepage"
    t.string   "city"
    t.string   "job"
    t.date     "birthday"
    t.string   "computer"
    t.string   "graphics"
    t.string   "distro"
    t.boolean  "minecraft_whitelisted", :default => false
    t.string   "minecraft_username"
    t.datetime "lastlogin"
    t.integer  "failed_logins",         :default => 0
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "article_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
