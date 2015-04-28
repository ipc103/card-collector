class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :player_id
      t.integer :user_id
      t.integer :year
      t.string :team
      t.float :batting_avg
      t.float :obp
      t.integer :home_runs
      t.integer :rbis

      t.timestamps null: false
    end
  end
end
