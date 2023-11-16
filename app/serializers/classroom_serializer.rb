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
class ClassroomSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :teachers, blueprint: TeacherSerializer, default: []
end
