class AddStatusToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :status, :boolean, default: false, null: false
  end
end
