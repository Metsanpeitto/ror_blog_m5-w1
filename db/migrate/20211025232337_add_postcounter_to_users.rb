class AddPostcounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_counter, :integer
  end
end
