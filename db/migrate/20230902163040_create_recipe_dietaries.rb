class CreateRecipeDietaries < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_dietaries do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :dietary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
