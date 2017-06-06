class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :marketawy
      t.references :user, index: true, foreign_key: true
    end
  end
end
