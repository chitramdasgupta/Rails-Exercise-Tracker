class AddForeignKeyConstraintToExercises < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :exercises, :users, column: :user_id
  end
end
