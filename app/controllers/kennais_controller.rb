class KennaisController < ApplicationController
    def create
        kennai = current_user.kennais.create(tweet_id: params[:tweet_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        kennai = Kennai.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
        kennai.destroy
        redirect_back(fallback_location: root_path)
      end
end
