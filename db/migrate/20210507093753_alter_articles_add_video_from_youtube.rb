class AlterArticlesAddVideoFromYoutube < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.string :video_link
    end
  end
end
