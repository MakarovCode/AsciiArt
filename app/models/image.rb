class Image < ApplicationRecord
  mount_uploader :source, ImageUploader

  validates :source, presence: true
end
