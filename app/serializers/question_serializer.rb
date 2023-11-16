class QuestionSerializer < Blueprinter::Base
  identifier :id

  fields :question, :answer, :created_at, :updated_at

  association :deck, blueprint: DeckSerializer
end