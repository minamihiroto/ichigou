class Organizer < ApplicationRecord
  has_secure_password
  
  before_save { self.email = email.downcase }

  validates :name, presence: true ,uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true ,uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  mount_uploader :image, ImageUploader

  def recruits
    return Recruit.where(organizer_id: self.id)
  end
end
