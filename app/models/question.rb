# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  answer     :string
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deck_id    :bigint
#
# Indexes
#
#  index_questions_on_deck_id  (deck_id)
#
# Foreign Keys
#
#  fk_rails_...  (deck_id => decks.id)
#
class Question < ApplicationRecord
  belongs_to :deck

  validates :question, presence: true, length: { minimum: 2 }
  validates :answer, presence: true, length: { minimum: 2 }
end
