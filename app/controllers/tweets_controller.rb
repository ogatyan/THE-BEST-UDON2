class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @tweets = Tweet.all
    end

      def new
        @tweet = Tweet.new
      end
      def top
      end
      def post  
      end
      def menu 
      end
      def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @tweet = Tweet.find(params[:id])
      end
      def edit
        @tweet = Tweet.find(params[:id])
      end
      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end
      def ranking
        @rank_kennais = Tweet.all.sort_by { |t| -t.kennais.count }.take(3)
        @rank_kengais = Tweet.all.sort_by { |t| -t.kengais.count }.take(3)
        @rank_sougou  = Tweet.all.sort_by { |t| -t.total_likes }.take(3)
      end
      def naibu
        @rank_kennais = Tweet.all.sort_by { |t| -t.kennais.count }.take(5)
      end
      def gaibu
        @rank_kengais = Tweet.all.sort_by { |t| -t.kengais.count }.take(5)
      end
      def sougou
        @rank_sougou  = Tweet.all.sort_by { |t| -t.total_likes }.take(5)
      end
      private
      def tweet_params
        params.require(:tweet).permit(:shop_name, :shop_place, :foods,:price,:parking,:open_close, :image,:genre)
      end
     
end
