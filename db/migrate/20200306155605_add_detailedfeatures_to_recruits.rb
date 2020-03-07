class AddDetailedfeaturesToRecruits < ActiveRecord::Migration[6.0]
  def change
    add_column :recruits, :capacity, :integer
    add_column :recruits, :genre, :string
    add_column :recruits, :guidelines, :string
    add_column :recruits, :award, :string
    add_column :recruits, :price, :integer
    add_column :recruits, :judging, :string
    add_column :recruits, :schedule, :date
    add_column :recruits, :facility, :string
    add_column :recruits, :backstage, :string
    add_column :recruits, :url, :string
    add_column :recruits, :organization, :string
    add_column :recruits, :prefectures, :string
  end
end
