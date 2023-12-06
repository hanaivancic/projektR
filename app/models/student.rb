# == Schema Information
#
# Table name: owners
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < Owner
  belongs_to :classroom
  has_many :student_questions, dependent: :destroy
  has_one :statistic, dependent: :destory

  validates :firstName, presence: true, length: { minimum: 2 }
  validates :lastName, presence: true, length: { minimum: 2 }
  validates :coinNumber, presence: true, numericality: { greater_than: 0, only_integer: true }
end
