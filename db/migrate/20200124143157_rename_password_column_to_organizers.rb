class RenamePasswordColumnToOrganizers < ActiveRecord::Migration[6.0]
  def change
    rename_column :organizers, :password, :password_digest
  end
end
