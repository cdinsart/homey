class Photo < ApplicationRecord
  belongs_to :desk
  mount_uploader :url, PhotoUploader
end
