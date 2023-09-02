class CreateJoinTableDietaryUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dietaries, :users do |t|
      t.index [:dietary_id, :user_id]
      t.index [:user_id, :dietary_id]
    end
  end
end
