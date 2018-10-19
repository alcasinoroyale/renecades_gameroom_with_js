class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :objective
      t.integer :number_of_players
      t.integer :reward_points
      t.string :genre

      t.timestamps
    end
  end
end
