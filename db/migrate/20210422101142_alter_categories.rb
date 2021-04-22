class AlterCategories < ActiveRecord::Migration[6.1]
  def change
    change_table :categories do |t|
      t.belongs_to :category
      t.boolean :enabled, default: false
      t.integer :order, default: 1
    end
  end
end
