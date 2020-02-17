class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :participants_id
      t.integer :recruits_id

      t.timestamps
    end
  end
end
