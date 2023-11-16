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
class QuestionSerializer < Blueprinter::Base
  identifier :id

  fields :question, :answer, :created_at, :updated_at

  association :deck, blueprint: DeckSerializer
end
