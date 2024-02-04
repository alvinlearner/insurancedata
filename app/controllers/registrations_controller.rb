class RegistrationsController < ApplicationController

    def create
        admin = Admin.create!(
            username: params['admin']['username'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )
        if admin
            session[:admin_id] = admin.id
            render json: {
                status: :created,
                admin: admin
            }
        else
          render json: { status: 500 }  
        end    
    end

end