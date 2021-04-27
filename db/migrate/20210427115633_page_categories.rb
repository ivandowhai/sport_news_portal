class PageCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :page_categories do |t|
      t.string :name
      t.boolean :enabled
    end

    remove_column :pages, :category

    change_table :pages do |t|
      t.belongs_to :page_categories
    end
  end
end
