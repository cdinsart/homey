class Desk < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  has_many :desk_features, dependent: :destroy
  has_many :features, through: :desk_features
  has_many :desks
  has_many :photos

  # basic validation
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true # , length: { minimum: 10 }
  after_validation :geocode, if: :will_save_change_to_address?
end
