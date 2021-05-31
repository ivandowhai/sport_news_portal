class CreateTablePhotoOfTheDay < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_of_the_days do |t|
      t.string :picture
      t.string :alt
      t.string :title
      t.string :description
      t.string :author
      t.boolean :show
      t.timestamps
    end
  end
end
