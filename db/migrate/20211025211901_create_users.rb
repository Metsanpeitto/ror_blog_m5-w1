class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :post_counter, default: 1
      t.string :email

      t.timestamps
    end
  end
end
