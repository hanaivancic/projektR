# == Schema Information
#
# Table name: owners
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ClassroomSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :teachers, blueprint: TeacherSerializer, default: []
end
