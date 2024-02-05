class AdminsController < ApplicationController

    def new
      @admin = Admin.new
    end
    
    def index
       render json: @admin = Admin.all 
    end

    # def create
    #     @admin = Admin.new(admin_params)
    #   if @admin.save
    #     session[:admin_id] = @admin.id # Log in the user after successful registration
    #     redirect_to user_path(@admin), notice: 'User was successfully created.'
    #   else
    #     render :new
    #   end
    # end


    
  def create
    admin = Admin.new(admin_params)
      
    if admin.save
      token = issue_token(admin)
      render json: {admin: AdminSerializer.new(admin), jwt: token}
    else
      if admin.error.messages
        render json: {error: admin.error.messages}
      else
        render json: {error: "Admin could not be created"}
      end
    end
  end	
  


  
    def show
        @admin = Admin.find(params[:id])
    end
  
    def edit
        @admin = Admin.find(params[:id])
    end
  
    def update
        @admin = Admin.find(params[:id])
      if @admin.update(admin_params)
        redirect_to user_path(@user), notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:username, :password, :password_confirmation)
    end
  end
  



