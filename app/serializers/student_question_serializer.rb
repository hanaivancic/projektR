class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :grade, :question, :answer, :created_at, :updated_at

  association :student, blueprint: StudentSerializer
  association :question, blueprint: QuestionSerializer
end