class SessionsController < ApplicationController
    before_action :authorize, only: [:show]

    def create
        @user = User.find_by(email: params[:email])
        if @user and @user.authenticate(params[:password])
          # debugger
            logged_user = JWT.encode( { user: @user.id }, ENV['JWT_TOKEN'] )
        #   session[:user_id] = user.id
          render json: { user: logged_user }, status: :ok
        else
          render json: { error: ["Invalid username and/or password"] }, status: :unauthorized
        end
      end

    # def destroy
    #     session.delete :user_id
    #     head :no_content
    # end

end
