class Classroom< ApplicationRecord
  has_one :owner, as: :ownable
  has_many :students
  has_and_belongs_to_many :teachers

  validates :name, presence: true, length: { minimum: 2 }
end
