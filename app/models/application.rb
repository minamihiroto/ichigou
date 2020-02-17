class Application < ApplicationRecord
  validates :participants_id, {presence: true}
  validates :recruits_id, {presence: true}
end
