class ClassroomSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :teachers, blueprint: TeacherSerializer, default: []
end
