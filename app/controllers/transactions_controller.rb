# class TransactionsController < ApplicationController

# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 

#   # GET /transactions
#   def index
#     transactions = Transaction.all
#     render json: transactions
#   end

#   # POST /transactions
#   # POST /transactions
#       def create
#         transaction = Transaction.new(transaction_params)
        
#         if transaction.save
#           render json: transaction, status: :created
#         else
#           puts "Transaction not saved. Errors: #{transaction.errors.full_messages}"
#           render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
#         end
#       end


#   # GET /transactions/:id
#   def show
#     transaction = find_transaction
#       render json: transaction
   
        
#   end

#   # PATCH /transactions/:id
#   def update
#     transaction = find_transaction
#       transaction.update(transaction_params)
#       render json: transaction
     
#   end

#   # PATCH /transactions/:id/like
#   def increment_likes
#     transaction = find_transaction
#       transaction.update(likes: transaction.likes + 1)
#       render json: transaction 
   
#   end

#   # DELETE /transactions/:id
#   def destroy
#     transaction = find_transaction
#     transaction
#     transaction.destroy
#     head :no_content

  
#   end

#   private

#   # def transaction_params
#   #   params.permit(:client_id, :policyno, :reg, :premium, :start, :expire, :classification, :insurance_companies_id)
#   # end


#   def transaction_params
#     params.require(:transaction).permit(:client_id, :policyno, :reg, :premium, :start, :expire, :classification, :insurance_companies_i)
#   end
  



#   def render_not_found_response

#     render json: { error: "Transaction not found" }, status: :not_found

#   end

#   def find_transaction
#     Transaction.find(params[:id])
#   end



# end



class TransactionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    # GET /transactions
    def index
      transactions = Transaction.all
      render json: transactions
    end
  
    # POST /transactions
    def create
      transaction = Transaction.new(transaction_params)
  
      if transaction.save
        render json: transaction, status: :created
      else
        puts "Transaction not saved. Errors: #{transaction.errors.full_messages}"
        render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /transactions/:id
    def show
      transaction = find_transaction
      render json: transaction 
    end
  
    # PATCH /transactions/:id
    def update
      transaction = find_transaction
      transaction.update(transaction_params)
      render json: transaction
    end
  
    # PATCH /transactions/:id/like
    def increment_likes
      transaction = find_transaction
      transaction.update(likes: transaction.likes + 1)
      render json: transaction
    end
  
    # DELETE /transactions/:id
    def destroy
      transaction = find_transaction
      transaction.destroy
      head :no_content
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:client_id, :policyno, :reg, :proposed, :start, :expire, :classification, :company_id)
    end
    
  
    def render_not_found_response
      render json: { error: "Transaction not found" }, status: :not_found
    end
  
    def find_transaction
      Transaction.find(params[:id])
    end
  end
  
  