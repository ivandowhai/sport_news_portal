class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :question
      t.integer :status, default: 0
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end

    create_table :answers do |t|
      t.string :answer
      t.belongs_to :survey
      t.timestamps
    end

    create_join_table :answers, :users
  end
end
