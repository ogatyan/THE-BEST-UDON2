class KengaisController < ApplicationController
    def create
        kengai = current_user.kengais.create(tweet_id: params[:tweet_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        kengai = Kengai.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
        kengai.destroy
        redirect_back(fallback_location: root_path)
      end
end
