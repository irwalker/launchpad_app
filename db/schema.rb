# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_07_211059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "reddit_id"
    t.text "body"
    t.string "author_name"
    t.string "subreddit_name"
    t.integer "replies_to_id"
    t.integer "number_of_replies"
    t.integer "upvotes"
    t.integer "downvotes"
    t.integer "score"
    t.integer "controversiality"
    t.string "listing_name"
    t.integer "listing_id"
    t.boolean "processed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["processed"], name: "index_comments_on_processed"
  end

  create_table "instrument_mentions", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "instrument_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_instrument_mentions_on_comment_id"
    t.index ["instrument_id"], name: "index_instrument_mentions_on_instrument_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "short"
    t.string "name"
    t.text "description"
    t.boolean "verified", default: false
    t.index ["short"], name: "index_instruments_on_short"
  end

  create_table "task_runners", force: :cascade do |t|
    t.string "task_name"
    t.string "feed_name"
    t.boolean "running", default: false
  end

end
