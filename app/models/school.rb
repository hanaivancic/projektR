# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class School < ApplicationRecord
  has_many :classrooms, dependent: :destory
  has_many :teachers, dependent: :destory

  validates :name, presence: true, length: { minimum: 2 }
end
