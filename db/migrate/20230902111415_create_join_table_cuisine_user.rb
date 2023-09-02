class CreateJoinTableCuisineUser < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cuisines, :users do |t|
      t.index [:cuisine_id, :user_id]
      t.index [:user_id, :cuisine_id]
    end
  end
end
