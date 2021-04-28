class CreateFooterElements < ActiveRecord::Migration[6.1]
  def change
    create_table :page_categories do |t|
      t.string :name
      t.boolean :enabled
    end

    create_table :pages do |t|
      t.string :name
      t.boolean :enabled
      t.string :slug
      t.text :body
      t.integer :priority, default: 1
      t.belongs_to :page_category

      t.timestamps
    end

    add_index :page_categories, :name, unique: true
    add_index :pages, :name, unique: true
  end
end
