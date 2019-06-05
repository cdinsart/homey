class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :desks
  has_many :bookings
  has_many :reviews

  def notify
    notification = 0
    if self.desks.any?
      self.desks.each { |desk|
        if desk.bookings.any?
          desk.bookings.each { |booking| notification += 1 if booking.status == 'pending' }
        end
      }
    end
    return notification
  end
end
