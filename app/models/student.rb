class Student < ApplicationRecord
  has_one :owner, as: :ownable
  belongs_to :classroom
  has_many :student_questions, dependent: :destroy
  has_one :statistic, dependent: :destory

  validates :name, presence: true, length: { minimum: 2 }
  validates :lastName, presence: true, length: { minimum: 2 }
  validates :coinNumber, presence: true, numericality: { greater_than: 0, only_integer: true }
end
