class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category

      t.timestamps
    end

    create_table :articles_categories do |t|
      t.references :categories
      t.references :articles
    end
  end
end
