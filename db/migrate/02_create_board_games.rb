class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :name
      t.integer :players
      t.string :manufacturer
      t.integer :user_id
    end
  end
end
