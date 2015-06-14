class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :string
    add_column :users, :hometown, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :string
    add_column :users, :travel_destinations, :string
  end
end
