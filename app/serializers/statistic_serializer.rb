class StatisticSerializer < Blueprinter::Base
  identifier :id

  fields :questionNumber, :correctNumber, :halfNumber, :incorrectNumber, :created_at, :updated_at

  association :student, blueprint: StudentSerializer
end