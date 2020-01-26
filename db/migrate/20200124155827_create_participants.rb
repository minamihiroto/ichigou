class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text :introduction
      t.string :image

      t.timestamps
    end
  end
end
