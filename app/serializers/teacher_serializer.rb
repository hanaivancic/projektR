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
class TeacherSerializer < Blueprinter::Base
  identifier :id

  fields :name, :lastName, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :classrooms, blueprint: ClassroomSerializer, default: []
end
