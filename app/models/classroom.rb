# == Schema Information
#
# Table name: classrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint
#
# Indexes
#
#  index_classrooms_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Classroom< ApplicationRecord
  has_many :decks
  has_many :students
  has_and_belongs_to_many :teachers

  validates :name, presence: true, length: { minimum: 2 }
end
