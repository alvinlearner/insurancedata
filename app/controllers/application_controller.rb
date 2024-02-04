# class ApplicationController < ActionController::Base
#     skip_before_action :verify_authenticity_token
# end


class ApplicationController < ActionController::API

    # before_action :require_session

    def jwt_key
        Rails.application.credentials.jwt_key
    end

    # def issue_token(admin)
    #     JWT.encode({admin_id: admin.id}, jwt_key, "HS256")
    # end

    def issue_token(admin)
        return nil unless admin&.id.present? && jwt_key.present?
      
        JWT.encode({ admin_id: admin.id }, jwt_key, "HS256")
      end
      

    def decoded_token
        begin
            JWT.decode(token, jwt_key, true, { :algorithm => 'HS256' })
        rescue => exception
            [{error: "Invalid Token"}]
        end    
    end
    
    def token
        request.headers["Authorization"]
    end

    def admin_id
        decoded_token.first["admin_id"]
    end

    def current_admin
        admin ||= Admin.find_by(id: admin_id)
    end

    def logged_in?
        !!current_admin
    end
end



