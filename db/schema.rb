# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081016191436) do

  create_table "grants", :force => true do |t|
    t.integer  "person_id"
    t.text     "title"
    t.text     "description"
    t.text     "pi"
    t.string   "role"
    t.string   "effort"
    t.string   "direct_costs"
    t.string   "grant_type"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.integer  "person_id"
    t.text     "title"
    t.text     "description"
    t.text     "meeting"
    t.text     "location"
    t.string   "presentation_type"
    t.date     "presented_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.integer  "person_id"
    t.string   "pubmed_identifier"
    t.string   "medline_identifier"
    t.text     "digital_object_identifier"
    t.text     "controlled_publisher_identifier"
    t.text     "authors"
    t.text     "title"
    t.string   "journal"
    t.string   "journal_abbreviation"
    t.string   "volume"
    t.string   "issue"
    t.string   "pages"
    t.text     "abstract"
    t.text     "mesh"
    t.text     "affiliations"
    t.text     "source"
    t.string   "publication_type"
    t.string   "year"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revus", :force => true do |t|
    t.integer  "person_id"
    t.integer  "revuable_id"
    t.string   "revuable_type"
    t.string   "type"
    t.float    "effort"
    t.float    "academic_value"
    t.float    "author_rank_score"
    t.float    "impact_factor"
    t.float    "role"
    t.float    "score"
    t.float    "funding_modifier"
    t.float    "pi_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "starts_on"
    t.date     "ends_on"
  end

  create_table "services", :force => true do |t|
    t.integer  "person_id"
    t.text     "title"
    t.text     "description"
    t.text     "organization"
    t.string   "service_type"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
