class Deck < ApplicationRecord
  belongs_to :owner
  has_many :questions, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
end
