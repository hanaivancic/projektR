# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_11_15_074316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_classrooms_on_school_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "ownableType"
    t.integer "ownableId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "deck_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deck_id"], name: "index_questions_on_deck_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "questionNumber"
    t.integer "correctNumber"
    t.integer "halfNumber"
    t.integer "incorrectNumber"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_statistics_on_student_id"
  end

  create_table "student_questions", force: :cascade do |t|
    t.integer "grade"
    t.string "question"
    t.string "answer"
    t.bigint "student_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_student_questions_on_question_id"
    t.index ["student_id"], name: "index_student_questions_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "lastName"
    t.integer "coinNumber"
    t.bigint "classroom_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
  end

  create_table "teacher_classrooms", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_teacher_classrooms_on_classroom_id"
    t.index ["teacher_id"], name: "index_teacher_classrooms_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "lastName"
    t.bigint "school_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  add_foreign_key "classrooms", "schools"
  add_foreign_key "questions", "decks"
  add_foreign_key "statistics", "students"
  add_foreign_key "student_questions", "questions"
  add_foreign_key "student_questions", "students"
  add_foreign_key "students", "classrooms"
  add_foreign_key "teacher_classrooms", "classrooms"
  add_foreign_key "teacher_classrooms", "teachers"
  add_foreign_key "teachers", "schools"
end
