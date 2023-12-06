# == Schema Information
#
# Table name: owners
#
#  id         :bigint           not null, primary key
#  owned_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owned_id   :bigint
#
# Indexes
#
#  index_owners_on_owned  (owned_type,owned_id)
#
class OwnerSerializer < Blueprinter::Base
  identifier :id
end
