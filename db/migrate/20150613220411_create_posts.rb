class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :trip_id
      t.integer :user_id
      t.integer :pin_id
      t.string :travel_date

      t.timestamps
    end
  end
end
