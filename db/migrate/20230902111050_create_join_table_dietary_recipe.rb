class CreateJoinTableDietaryRecipe < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dietaries, :recipes do |t|
      t.index [:dietary_id, :recipe_id]
      t.index [:recipe_id, :dietary_id]
    end
  end
end
