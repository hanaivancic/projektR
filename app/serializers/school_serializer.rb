# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SchoolSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at
end
