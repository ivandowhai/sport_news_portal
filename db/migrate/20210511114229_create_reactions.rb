class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.boolean :like
      t.belongs_to :comment
      t.belongs_to :user
      t.timestamps
    end
  end
end
