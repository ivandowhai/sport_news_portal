class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :category
      t.boolean :enabled, default: false
      t.integer :priority, default: 1
      t.timestamps
    end
  end
end
