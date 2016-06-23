class LotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  def index
    @lots = Lot.all
  end

  def show
  end

  def new
    @lot = Lot.new
  end

  def edit
  end

  def create
    @lot = Lot.new(lot_params)

    respond_to do |format|
      if @lot.save
        format.html { redirect_to lots_path, notice: 'Lot was successfully created.' }
        format.json { render :show, status: :created, location: @lot }
      else
        format.html { render :new }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to lots_path, notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lot
      @lot = Lot.find(params[:id])
    end

    def lot_params
      params.require(:lot).permit(:name, :description, :property_id)
    end
end
