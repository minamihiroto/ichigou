class Organizer < ApplicationRecord
  has_secure_password

  validates :name, {presence: true ,uniqueness: true}
  validates :email, {presence: true ,uniqueness: true}

  def recruits
    return Recruit.where(organizer_id: self.id)
  end
end
