class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :name, :lastName, :coinNumber, :created_at, :updated_at

  association :classroom, blueprint: ClassroomSerializer
end
