class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.string :name
      t.integer :status, default: 0
      t.string :image
      t.datetime :closed
      t.belongs_to :category
      t.timestamps
    end
  end
end
