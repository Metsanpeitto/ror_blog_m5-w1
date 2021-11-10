class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true,index: true
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 1
      t.integer :likes_counter, default: 1

      t.timestamps
    end
  end
end
