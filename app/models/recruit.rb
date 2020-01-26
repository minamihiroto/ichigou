class Recruit < ApplicationRecord
  validates :title, {presence: true ,uniqueness: true}
  validates :text, {presence: true ,uniqueness: true}
  validates :place, {presence: true ,uniqueness: true}
  validates :organizer_id, {presence: true}

  def organizer
    return Organizer.find_by(id: self.organizer_id)
  end
end
