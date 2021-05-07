class CreateLocales < ActiveRecord::Migration[6.1]
  def change
    create_table :locales do |t|
      t.string :code
      t.boolean :enabled, default: false
      t.timestamps
    end
  end
end
