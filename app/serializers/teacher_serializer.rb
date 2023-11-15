class TeacherSerializer < Blueprinter::Base
  identifier :id

  fields :name, :lastName, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :classrooms, blueprint: ClassroomSerializer, default: []
end
