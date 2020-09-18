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

ActiveRecord::Schema.define(version: 2020_03_16_210703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table :users, force: :cascade do |t|
    t.string :name
		t.string :title
		t.string :password_digest
  end

  create_table :contacts, force: :cascade do |t|
    t.string  :title
    t.string  :value
    t.bigint  :user_id
    t.index   [:user_id], name: "index_contacts_on_user_id"
  end
	
	create_table :skills, force: :cascade do |t|
    t.string  :name
		t.bigint  :user_id
    t.index   [:user_id], name: "index_skills_on_user_id"
  end
	
	create_table :jobs, force: :cascade do |t|
    t.string  :employer
		t.string  :title
		t.integer :start_year
		t.integer :end_year
		t.string  :location
		t.text    :description
		t.bigint  :user_id
    t.index   [:user_id], name: "index_jobs_on_user_id"
  end
	
	create_table :projects, force: :cascade do |t|
    t.string  :title
		t.integer :year
		t.text    :description
		t.bigint  :user_id
    t.index   [:user_id], name: "index_projects_on_user_id"
  end
	
	create_table :schools, force: :cascade do |t|
    t.string  :name
		t.string  :location, null: true
		t.string  :degree, null: true
		t.string  :emphasis
		t.integer :start_year, null: true
		t.integer :end_year		
		t.boolean :online, default: false
		t.bigint  :user_id
    t.index   [:user_id], name: "index_schools_on_user_id"
  end

  add_foreign_key :contacts, :users
	add_foreign_key :skills, :users
	add_foreign_key :jobs, :users
	add_foreign_key :projects, :users
	add_foreign_key :schools, :users
end
