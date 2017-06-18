class FinancialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financials
  # GET /financials.json
  def index
    if params[:operation]
      @financials = Financial.where(user_id: current_user.id, operation: params[:operation]).order(id: :desc).page params[:page]
    else
      @financials = Financial.where(user_id: current_user.id).order(id: :desc).page params[:page]
    end
  end

  # GET /financials/1
  # GET /financials/1.json
  def show
  end

  # GET /financials/new
  def new
    @financial = Financial.new
  end

  def new_financial_ajax
    @model_name = params[:model]
    @model = @model_name.singularize.classify.constantize.find(params[:id])
    @financial = @model.financials.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials
  # POST /financials.json
  def create
    
    @financial = Financial.new(financial_params)
    @financial.value = financial_params[:value].gsub(/[.]/, '').gsub(/[,]/, '.')

    @financial.user_id = @current_user.id
    respond_to do |format|
      if @financial.save
        format.html { redirect_to @financial, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @financial }
        format.js   { render 'financial_show', financials: @financial}
      else
        format.html { render :new }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
        format.js   { render 'new_financial_ajax'}
      end
    end
  end

  # PATCH/PUT /financials/1
  # PATCH/PUT /financials/1.json
  def update
    @financial_params = financial_params
    @financial_params[:value] = financial_params[:value].gsub(/[.]/, '').gsub(/[,]/, '.')
    respond_to do |format|
      if @financial.update(@financial_params)
        format.html { redirect_to @financial, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @financial }
      else
        format.html { render :edit }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financials_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  def shipment_financial

  end

  def financial_shipment
    binding.pry

  end

  def close_financial

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_params
      params.require(:financial).permit(:datestart, :dateend, :value, :datetransaction, :operation, :description, :animal_id, :service_id, :employee_id, :reproduction_id, :stock_id, :treatment_id, :shipment_id, :schedule_id, :service_id, :user_id)
    end

end
