class SessionsController < ApplicationController
    def create
      user = Admin.find_by(username: params[:username]) || Admin.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { user: user }, status: :created
      else
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
    end
    
        def destroy
        session[:admin_id] = nil # Log out the user
      end
  end
