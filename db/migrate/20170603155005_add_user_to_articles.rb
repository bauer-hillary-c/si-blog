class AddUserToArticles < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :articles, :user
    add_reference :articles, :user, index: true
  end
end
