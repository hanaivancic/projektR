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
class Deck < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :student
  belongs_to :classroom

  validates :name, presence: true, length: { minimum: 2 }
end
