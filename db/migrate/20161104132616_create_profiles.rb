class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.text :about
      t.references :user, index: true, foreign_key: true

      t.timestamps  
    end
  end
end
