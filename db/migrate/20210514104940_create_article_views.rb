class CreateArticleViews < ActiveRecord::Migration[6.1]
  def change
    create_table :article_views do |t|
      t.belongs_to :article
      t.timestamps
    end
  end
end
