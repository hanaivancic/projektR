# == Schema Information
#
# Table name: teachers
#
#  id         :bigint           not null, primary key
#  lastName   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint
#
# Indexes
#
#  index_teachers_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Teacher < ApplicationRecord
  has_and_belongs_to_many :classrooms
  belongs_to :school

  validates :name, presence: true, length: { minimum: 2 }
  validates :lastName, presence: true, length: { minimum: 2 }
end
