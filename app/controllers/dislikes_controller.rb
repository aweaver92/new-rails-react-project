class DislikesController < ApplicationController

    def create
        dislike = Dislike.create!(dislike_paramas)
        render json: dislike, status: :created
    end

    private

    def dislike_paramas
        params.permit(:logged_in_id, :disliked_id)
    end

end
