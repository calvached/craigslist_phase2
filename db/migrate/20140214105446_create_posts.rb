class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.string :title
      t.string :price
      t.text :description
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end
