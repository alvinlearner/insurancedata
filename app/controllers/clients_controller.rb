class ClientsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    
      # GET /clients
      def index
        clients = Client.all
        render json: clients
      end
    
      # POST /clients
      def create
        client = Client.create(client_params)
        render json: client, status: :created
      end
    
      # GET /clients/:id
      def show
        client = find_client
          render json: client
       
            
      end
    
      # PATCH /clients/:id
      def update
        client = find_client
          client.update(client_params)
          render json: client
         
      end
    
    
      #Client counts
      def count
        clients = Client.all
        render json: clients.count
      end
    
    
      # PATCH /clients/:id/like
      def increment_likes
        client = find_client
          client.update(likes: client.likes + 1)
          render json: client 
       
      end
    
      # DELETE /clients/:id
      def destroy
        client = find_client
        client
        client.destroy
        head :no_content
    
      
      end
    
      private
    
      def client_params
        params.permit(:name, :phone, :email, :krapin, :idno)
      end
    
      def render_not_found_response
    
        render json: { error: "Client not found" }, status: :not_found
    
      end
    
      def find_client
        Client.find(params[:id])
      end
    
    
    
    end
    