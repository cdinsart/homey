class Desk < ApplicationRecord
  belongs_to :user
  has_many :desk_features, dependent: :destroy
  has_many :features, through: :desk_features
  # nested attributes
  accepts_nested_attributes_for :desk_features
  # basic validation
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
