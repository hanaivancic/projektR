# == Schema Information
#
# Table name: students
#
#  id           :bigint           not null, primary key
#  coinNumber   :integer
#  firstName    :string
#  lastName     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :bigint
#
# Indexes
#
#  index_students_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#
class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :firstName, :lastName, :coinNumber, :created_at, :updated_at

  association :classroom, blueprint: ClassroomSerializer
end
