class Question < ApplicationRecord
  belongs_to :deck

  validates :question, presence: true, length: { minimum: 2 }
  validates :answer, presence: true, length: { minimum: 2 }
end
