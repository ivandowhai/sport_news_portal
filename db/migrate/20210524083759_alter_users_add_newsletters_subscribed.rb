class AlterUsersAddNewslettersSubscribed < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :subscription_email
    end
  end
end
