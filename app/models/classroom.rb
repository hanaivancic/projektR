# == Schema Information
#
# Table name: owners
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Classroom < Owner
  has_many :students
  has_and_belongs_to_many :teachers

  validates :name, presence: true, length: { minimum: 2 }
end
