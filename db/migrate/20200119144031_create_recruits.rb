class CreateRecruits < ActiveRecord::Migration[6.0]
  def change
    create_table :recruits do |t|
      t.text :text

      t.timestamps
    end
  end
end
