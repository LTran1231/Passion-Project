class CreateCountries < ActiveRecord::Migration
  def change
  	create_table :countries do |t|
  		t.string :country
  	end
  end
end
