class Destruction < ActiveRecord::Migration[6.0]
  def change
    drop_table :participants
  end
end
