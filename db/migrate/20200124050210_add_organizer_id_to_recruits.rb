class AddOrganizerIdToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :organizer_id, :integer
  end
end
