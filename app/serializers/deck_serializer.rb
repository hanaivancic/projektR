# == Schema Information
#
# Table name: decks
#
#  id           :bigint           not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :bigint
#  student_id   :bigint
#
# Indexes
#
#  index_decks_on_classroom_id  (classroom_id)
#  index_decks_on_student_id    (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (student_id => students.id)
#
class DeckSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :student, blueprint: StudentSerializer
  association :classroom, blueprint: ClassroomSerializer
  association :questions, blueprint: QuestionSerializer, default: []
end
