class CreateUserTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_times do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :max_cooking_time

      t.timestamps
    end
  end
end
