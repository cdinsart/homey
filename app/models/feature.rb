class Feature < ApplicationRecord
  has_many :desk_features
  validates :name, presence: true
end
