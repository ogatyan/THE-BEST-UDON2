class AddShopPlaceToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :shop_place, :string
  end
end
