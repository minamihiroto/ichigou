class AddPasswordToOrganizers < ActiveRecord::Migration[6.0]
  def change
    add_column :organizers, :password, :string
  end
end
