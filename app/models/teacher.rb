class Teacher < ApplicationRecord
  has_and_belongs_to_many :classrooms
  belongs_to :school

  validates :name, presence: true, length: { minimum: 2 }
  validates :lastName, presence: true, length: { minimum: 2 }
end
