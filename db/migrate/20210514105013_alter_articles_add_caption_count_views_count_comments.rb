class AlterArticlesAddCaptionCountViewsCountComments < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.string :caption
      t.integer :views_count
      t.integer :comments_count
    end
  end
end
