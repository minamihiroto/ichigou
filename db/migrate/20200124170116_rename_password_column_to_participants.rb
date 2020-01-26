class RenamePasswordColumnToParticipants < ActiveRecord::Migration[6.0]
  def change
    rename_column :participants, :password, :password_digest
  end
end
