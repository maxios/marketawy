class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :about
      t.string :fb
      t.string :twitter
      t.string :linkedin
      t.string :plus
      t.string :insta
      t.string :youtube
      t.string :website
      t.string :other_link
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
