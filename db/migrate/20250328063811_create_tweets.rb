class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :shop_name
      t.string :foods
      t.integer :price
      t.string :parking
      t.string :open_close

      t.timestamps
    end
  end
end
