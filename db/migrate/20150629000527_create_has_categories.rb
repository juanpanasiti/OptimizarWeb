class CreateHasCategories < ActiveRecord::Migration
  def change
    create_table :has_categories do |t|
      t.references :category, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :has_categories, :categories
    add_foreign_key :has_categories, :articles
  end
end
