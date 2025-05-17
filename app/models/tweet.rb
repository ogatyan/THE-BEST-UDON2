class Tweet < ApplicationRecord
    belongs_to :user
    has_many :kennais, dependent: :destroy
    has_many :liked_kengais, through: :kennais, source: :user
    has_many :kengais, dependent: :destroy
  has_many :liked_kennais, through: :kengais, source: :user
    has_one_attached :image
    def total_likes
      kennai_count = kennais.size
      kengai_count = kengais.size
      kennai_count + kengai_count
  end 
end
