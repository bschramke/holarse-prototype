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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131130195106) do

  create_table "articles", force: true do |t|
    t.string   "title",                                     null: false
    t.string   "alternate_title"
    t.text     "content"
    t.boolean  "enabled",                   default: true
    t.boolean  "isfrozen",                  default: false
    t.boolean  "reviseme",                  default: false
    t.boolean  "unreleased",                default: false
    t.boolean  "allowuploads",              default: true
    t.boolean  "hasftp",                    default: false
    t.string   "releasedate"
    t.string   "changelog"
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "comments_allowed",          default: true
    t.integer  "project_activity_state_id"
  end

  create_table "articles_attachments", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "attachment_id"
  end

  create_table "articles_links", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "link_id"
  end

  create_table "articles_screenshots", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "screenshot_id"
  end

  create_table "articles_videos", id: false, force: true do |t|
    t.integer "article_id"
    t.integer "video_id"
  end

  create_table "attachments", force: true do |t|
    t.string   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "attachfile_file_name"
    t.string   "attachfile_content_type"
    t.integer  "attachfile_file_size"
    t.datetime "attachfile_updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.boolean  "enabled",          default: true
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "discount_events", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "website"
    t.string   "sourceurl"
    t.boolean  "enabled",          default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "comments_allowed", default: true
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "links_news", id: false, force: true do |t|
    t.integer "news_id"
    t.integer "link_id"
  end

  create_table "news", force: true do |t|
    t.string   "title",                            null: false
    t.text     "content"
    t.boolean  "enabled",          default: true
    t.boolean  "isfrozen",         default: false
    t.boolean  "reviseme",         default: false
    t.boolean  "unreleased",       default: false
    t.boolean  "allowuploads",     default: true
    t.boolean  "hasftp",           default: false
    t.string   "releasedate"
    t.string   "changelog"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "subtitle"
    t.boolean  "comments_allowed", default: true
    t.integer  "news_category_id"
  end

  create_table "news_categories", force: true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "news_screenshots", id: false, force: true do |t|
    t.integer "news_id"
    t.integer "screenshot_id"
  end

  create_table "news_videos", id: false, force: true do |t|
    t.integer "news_id"
    t.integer "video_id"
  end

  create_table "project_activity_states", force: true do |t|
    t.string "name"
    t.string "code"
  end

  create_table "revisions", force: true do |t|
    t.integer  "historical_id"
    t.string   "historical_type"
    t.text     "changedset"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "screenshots", force: true do |t|
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "shops", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "active",                default: true
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
    t.boolean  "minecraft_whitelisted", default: false
    t.string   "minecraft_username"
    t.datetime "lastlogin"
    t.integer  "failed_logins",         default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "lastactivity"
    t.string   "diaspora"
    t.string   "steam"
    t.boolean  "collaborate",           default: false
  end

  create_table "videos", force: true do |t|
    t.string   "url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
