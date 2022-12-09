class LikesController < ApplicationController
    # before_action :authorize, only: [:show]

    def create
        like = Like.create!(like_paramas)
        render json: like, status: :created
    end

    private

    def dislike_paramas
        params.permit(:logged_in_id, :liked_id)
    end

end
