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
class StudentQuestion < ApplicationRecord
  belongs_to :student
  belongs_to :question

  validates :question, presence: true, length: { minimum: 2 }
  validates :answer, presence: true, length: { minimum: 2 }
  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2,
                                                    only_integer: true }
end
