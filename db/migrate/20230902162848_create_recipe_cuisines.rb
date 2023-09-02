class CreateRecipeCuisines < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_cuisines do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :cuisine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
