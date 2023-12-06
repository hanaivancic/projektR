# == Schema Information
#
# Table name: owners
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :firstName, :lastName, :coinNumber, :created_at, :updated_at

  association :classroom, blueprint: ClassroomSerializer
end
