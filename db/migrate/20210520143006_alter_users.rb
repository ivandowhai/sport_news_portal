class AlterUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.boolean :enabled
      t.boolean :online
    end
  end
end
