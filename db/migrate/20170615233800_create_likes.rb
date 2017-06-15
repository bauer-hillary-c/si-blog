class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :users
      t.references :articles

      t.timestamps
    end
  end
end
