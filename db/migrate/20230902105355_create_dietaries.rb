class CreateDietaries < ActiveRecord::Migration[7.0]
  def change
    create_table :dietaries do |t|
      t.string :dietary_type

      t.timestamps
    end
  end
end
