class AddRankToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rank, :string
  end
end
