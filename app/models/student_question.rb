class StudentQuestion < ApplicationRecord
  belongs_to :student
  belongs_to :question

  validates :question, presence: true, length: { minimum: 2 }
  validates :answer, presence: true, length: { minimum: 2 }
  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2,
                                                    only_integer: true }
end
