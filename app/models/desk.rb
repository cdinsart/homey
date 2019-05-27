class Desk < ApplicationRecord
  belongs_to :user
  has_many :desk_features
  has_many :features, through: :desk_features
end
