class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    	add_column :users, :fullname, :string
    	add_column :users, :country, :string
    	add_column :users, :city, :string
    	add_column :users, :phone_number, :string
    	add_column :users, :jobtitle, :string
    	add_column :users, :jobrole, :string
  end
end
