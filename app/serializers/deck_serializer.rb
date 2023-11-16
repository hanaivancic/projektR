# == Schema Information
#
# Table name: decks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DeckSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :school, blueprint: SchoolSerializer
  association :teachers, blueprint: TeacherSerializer, default: []
end
