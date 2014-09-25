class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.integer :status, default: 0
      t.integer :reps, default: 0

      t.timestamps
    end

    add_index :workouts, :user_id
  end
end
