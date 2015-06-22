class CreateUserBookmarks < ActiveRecord::Migration
  def change 
  	create_table :user_bookmarks do |t|
  		t.integer :user_id
  		t.integer :bookmark_id
  end
end
