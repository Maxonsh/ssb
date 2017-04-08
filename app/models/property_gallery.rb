class PropertyGallery < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :property
end
