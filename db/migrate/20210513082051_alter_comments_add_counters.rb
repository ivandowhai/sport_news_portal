class AlterCommentsAddCounters < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.integer :likes_count
      t.integer :dislikes_count
    end
  end
end
