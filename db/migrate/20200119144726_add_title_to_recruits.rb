class AddTitleToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :title, :string
  end
end
