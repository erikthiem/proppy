class AddLockedToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :locked, :boolean, default: false
  end
end
