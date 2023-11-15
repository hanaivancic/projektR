class Owner < ApplicationRecord
  belongs_to :ownable, polymorphic: true
  validates :name, presence: true
end
