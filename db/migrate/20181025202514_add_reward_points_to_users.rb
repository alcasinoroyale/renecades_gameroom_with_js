class AddRewardPointsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reward_points, :integer
  end
end
