class CreateOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :email
      t.text :introduction
      t.string :image

      t.timestamps
    end
  end
end
