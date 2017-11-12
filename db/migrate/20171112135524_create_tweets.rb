class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :game_id
      t.text :message

      t.timestamps
    end
  end
end
