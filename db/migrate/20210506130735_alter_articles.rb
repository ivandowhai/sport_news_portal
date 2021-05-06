class AlterArticles < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.string :image
    end
  end
end
