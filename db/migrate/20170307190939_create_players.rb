class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.string :color
      t.string :nerd_type
      t.integer :score
      t.integer :latest_score

      t.timestamps
    end
  end
end
