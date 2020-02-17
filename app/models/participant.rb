class Participant < ApplicationRecord
  has_secure_password

  validates :name, presence: true ,uniqueness: true
  validates :email, presence: true ,uniqueness: true

  mount_uploader :image, ImageUploader

end
