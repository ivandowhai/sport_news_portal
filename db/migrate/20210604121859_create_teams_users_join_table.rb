class CreateTeamsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :teams, :users
  end
end
