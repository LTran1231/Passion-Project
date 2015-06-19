class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :city_id
      t.integer :country_id
      t.string :travel_date
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
