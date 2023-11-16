# == Schema Information
#
# Table name: statistics
#
#  id              :bigint           not null, primary key
#  correctNumber   :integer
#  halfNumber      :integer
#  incorrectNumber :integer
#  questionNumber  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint
#
# Indexes
#
#  index_statistics_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class StatisticSerializer < Blueprinter::Base
  identifier :id

  fields :questionNumber, :correctNumber, :halfNumber, :incorrectNumber, :created_at, :updated_at

  association :student, blueprint: StudentSerializer
end
