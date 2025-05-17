class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one_attached :image 
         has_many :tweets, dependent: :destroy
         has_many :kennais, dependent: :destroy
         has_many :liked_tweets, through: :kennais, source: :tweet
         has_many :kengais, dependent: :destroy
         has_many :liked_tweets, through: :kengais, source: :tweet
         def already_liked?(tweet)
          self.kennais.exists?(tweet_id: tweet.id)
         end
         def already_kengaied?(tweet)
          self.kengais.exists?(tweet_id: tweet.id)
         end
         validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 }
end
