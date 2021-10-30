class AddCascade < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key "comments", "posts"
    add_foreign_key "comments", "posts", on_delete: :cascade

        remove_foreign_key "comments", "users"
    add_foreign_key "comments", "users", on_delete: :cascade

        remove_foreign_key "likes", "posts"
    add_foreign_key "likes", "posts", on_delete: :cascade

        remove_foreign_key "likes", "users"
    add_foreign_key "likes", "users", on_delete: :cascade

        remove_foreign_key "posts", "users"
    add_foreign_key "posts", "users", on_delete: :cascade
  end
end
