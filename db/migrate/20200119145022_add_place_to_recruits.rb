class AddPlaceToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :place, :string
  end
end
