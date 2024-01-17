# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  coinNumber   :integer
#  firstName    :string
#  lastName     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :bigint
#
# Indexes
#
#  index_students_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#
class Student < ApplicationRecord
  has_secure_token
  
  has_many :decks
  belongs_to :classroom
  has_many :student_questions, dependent: :destroy
  has_one :statistic, dependent: :destroy

  validates :firstName, presence: true, length: { minimum: 2 }
  validates :lastName, presence: true, length: { minimum: 2 }
  validates :coinNumber, presence: true, numericality: { greater_than: 0, only_integer: true }
end
