class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :location
      t.belongs_to :category
      t.belongs_to :subcategory, foreign_key: {to_table: :categories}
      t.string :team
      t.string :logo
      t.timestamps
    end
  end
end
