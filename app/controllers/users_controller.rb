class UsersController < ApplicationController
    
      before_action :authorize!

    def index
        users = User.all
        render json: users, status: :ok
    end

    def create
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end 

    private
  
    # def authorize
    #   return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end
  
    # def user_params
    #   params.permit(:name, :password)
    # end

end
