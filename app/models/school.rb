class School < ApplicationRecord
  has_many :classrooms, dependent: :destory
  has_many :teachers, dependent: :destory

  validates :name, presence: true, length: { minimum: 2 }
end
