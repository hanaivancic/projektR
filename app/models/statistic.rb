class Statistic < ApplicationRecord
  belongs_to :student

  validates :questionNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :correctNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :halfNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :incorrectNumber, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
