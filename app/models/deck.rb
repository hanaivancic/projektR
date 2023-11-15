# == Schema Information
#
# Table name: decks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Deck < ApplicationRecord
  belongs_to :owner
  has_many :questions, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
end
