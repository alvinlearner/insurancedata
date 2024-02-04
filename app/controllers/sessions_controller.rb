# class SessionsController < ApplicationController
#     def create
#       user = Admin.find_by(username: params[:username]) || Admin.find_by(username: params[:username])
#       if user&.authenticate(params[:password])
#         session[:user_id] = user.id
#         render json: { user: user }, status: :created
#       else
#         render json: { errors: ["Invalid username or password"] }, status: :unauthorized
#       end
#     end
    
#         def destroy
#         session[:admin_id] = nil # Log out the user
#       end
#   end


class SessionsController < ApplicationController

    # skip_before_action :require_session, only: [:new, :create]

  def create
    admin = Admin.find_by(username: params[:username])

      if admin && admin.authenticate(session_params[:password])
          token = issue_token(admin)
          render json: {admin: AdminSerializer.new(admin), jwt: token}
      else
          render json: {error: "Incorrect username or password."}
      end
  end

  def show
      if logged_in?
          render json: current_admin
      else
          render json: {error: "User is not logged in/could not be found."}
      end
  end


          def destroy
             session[:admin_id] = nil # Log out the user
          end


  private
  def session_params
      params.require(:session).permit(:username, :password)
  end
end