class CompaniesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    # GET /insurance_companies
    def index
      insurance_companies = Company.all
      render json: insurance_companies
    end
  
    # POST /insurance_companies
    def create
      company = Company.create(company_params)
      render json: company, status: :created
    end
  
    # GET /insurance_companies/:id
    def show
      company = find_company
      render json: company
    end
  
    # PATCH /insurance_companies/:id
    def update
      company = find_company
      company.update(company_params)
      render json: company
    end
  
    # DELETE /insurance_companies/:id
    def destroy
      company = find_company
      company.destroy
      render json: { success: 'insurance company deleted successfully'}
    end
  
    private
  
    def company_params
      params.permit(:organization, :rate, :excessprotector, :pvt, :lossofuse, :pcf, :itl, :stampduty)
    end
  
    def render_not_found_response
      render json: { error: "Insurance Company not found" }, status: :not_found
    end
  
    def find_company
      Company.find(params[:id])
    end
  end