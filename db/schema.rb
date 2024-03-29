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

ActiveRecord::Schema.define(version: 20140320095432) do

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "comments_allowed",          default: true
    t.integer  "project_activity_state_id"
    t.string   "slug",                                      null: false
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", using: :btree

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

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "enabled",          default: true
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "comments_allowed", default: true
  end

  create_table "drafts", force: true do |t|
    t.integer  "draftable_id"
    t.string   "draftable_type"
    t.text     "draftedtext"
    t.integer  "user_id"
    t.boolean  "allow_collaboration", default: false
    t.integer  "merge_revision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "inboxes", force: true do |t|
    t.string   "sender"
    t.string   "url"
    t.text     "info"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subtitle"
    t.boolean  "comments_allowed", default: true
    t.integer  "news_category_id"
    t.string   "slug",                             null: false
  end

  create_table "news_categories", force: true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "news_updates", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "event"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
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

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "lastactivity"
    t.string   "diaspora"
    t.string   "steam"
    t.boolean  "collaborate",           default: false
    t.string   "slug",                                  null: false
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "videos", force: true do |t|
    t.string  "url"
    t.integer "videoable_id"
    t.string  "videoable_type"
  end

end
