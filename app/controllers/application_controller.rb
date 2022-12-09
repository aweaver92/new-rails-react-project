class ApplicationController < ActionController::API
    # include ActionController::Cookies

    # def hello_world
    #   session[:count] = (session[:count] || 0) + 1
    #   render json: { count: session[:count] }
    # end

    def current_user 
      auth_token = request.headers['auth_token']
      if auth_token
        token = JWT.decode(auth_token, ENV['JWT_TOKEN'])[0]
        return User.find_by(id: token['user'])
      else
        return nil
      end
    end

    def authorize!
      unless current_user
        render json: { errors: ['you must be logged in to do that']}, status: 
          :unauthorized
        end
      end
  end
