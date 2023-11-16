# == Schema Information
#
# Table name: decks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint
#
# Indexes
#
#  index_decks_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => owners.id)
#
class DeckSerializer < Blueprinter::Base
  identifier :id

  fields :name, :created_at, :updated_at

  association :owner, blueprint: OwnerSerializer
  association :teachers, blueprint: TeacherSerializer, default: []
end
