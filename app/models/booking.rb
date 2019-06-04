class Booking < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :desk
  has_many :reviews
  validates :date, presence: true
end
