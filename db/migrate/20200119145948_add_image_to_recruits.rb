class AddImageToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :image, :string
  end
end
