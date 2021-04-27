class CreateFooterElements < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.boolean :enabled
      t.string :category
      t.string :slug
      t.text :body
      t.integer :order, default: 1

      t.timestamps
    end
  end
end
