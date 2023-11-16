# == Schema Information
#
# Table name: student_questions
#
#  id          :bigint           not null, primary key
#  answer      :string
#  grade       :integer
#  question    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_student_questions_on_question_id  (question_id)
#  index_student_questions_on_student_id   (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (student_id => students.id)
#
class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :grade, :question, :answer, :created_at, :updated_at

  association :student, blueprint: StudentSerializer
  association :question, blueprint: QuestionSerializer
end
