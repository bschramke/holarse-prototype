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

ActiveRecord::Schema.define(:version => 20130122205304) do

  create_table "article_histories", :force => true do |t|
    t.string    "title"
    t.string    "alternate_title"
    t.text      "content",         :limit => 16777216
    t.integer   "user_id",         :limit => 32
    t.integer   "article_id",      :limit => 32
    t.timestamp "created_at",      :limit => 26,       :null => false
    t.timestamp "updated_at",      :limit => 26,       :null => false
  end

  create_table "articles", :force => true do |t|
    t.string    "title",                                                  :null => false
    t.string    "alternate_title"
    t.text      "content",         :limit => 16777216
    t.boolean   "enabled",         :limit => 8,        :default => true
    t.boolean   "isfrozen",        :limit => 8,        :default => false
    t.boolean   "reviseme",        :limit => 8,        :default => false
    t.boolean   "unreleased",      :limit => 8,        :default => false
    t.boolean   "allowuploads",    :limit => 8,        :default => true
    t.boolean   "hasftp",          :limit => 8,        :default => false
    t.string    "releasedate"
    t.string    "changelog"
    t.integer   "user_id",         :limit => 32
    t.timestamp "created_at",      :limit => 26,                          :null => false
    t.timestamp "updated_at",      :limit => 26,                          :null => false
  end

  create_table "roles", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :limit => 26, :null => false
    t.timestamp "updated_at", :limit => 26, :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id", :limit => 32
    t.integer "role_id", :limit => 32
  end

  create_table "shops", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :limit => 26, :null => false
    t.timestamp "updated_at", :limit => 26, :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "email"
    t.boolean   "active",                :limit => 8,        :default => true
    t.string    "old_password_hash"
    t.string    "password_digest"
    t.text      "signature",             :limit => 16777216
    t.string    "jabber"
    t.string    "icq"
    t.string    "twitter"
    t.string    "homepage"
    t.string    "city"
    t.string    "job"
    t.date      "birthday",              :limit => 10
    t.string    "computer"
    t.string    "graphics"
    t.string    "distro"
    t.boolean   "minecraft_whitelisted", :limit => 8,        :default => false
    t.string    "minecraft_username"
    t.timestamp "lastlogin",             :limit => 26
    t.integer   "failed_logins",         :limit => 32,       :default => 0
    t.timestamp "created_at",            :limit => 26,                          :null => false
    t.timestamp "updated_at",            :limit => 26,                          :null => false
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size",      :limit => 32
    t.timestamp "avatar_updated_at",     :limit => 26
  end

end
