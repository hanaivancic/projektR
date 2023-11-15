# == Schema Information
#
# Table name: statistics
#
#  id              :bigint           not null, primary key
#  correctNumber   :integer
#  halfNumber      :integer
#  incorrectNumber :integer
#  questionNumber  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint
#
# Indexes
#
#  index_statistics_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Statistic < ApplicationRecord
  belongs_to :student

  validates :questionNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :correctNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :halfNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :incorrectNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
