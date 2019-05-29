class Photo < ApplicationRecord
  belongs_to :desk
  mount_uploader :data, PhotoUploader
end
