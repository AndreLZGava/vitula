class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :animal_development, :animal_production, :animal_reproduction]
  before_action :set_reproduction, only: [:show, :edit, :new, :create, :update, :destroy]

  def index
    @animals = Animal.animais(current_user, params[:page])
  end

  def show
  end

  def new
    @reproduction = Reproduction.all
    @animal = Animal.new
    @animal.productions.build
    @animal.developments.build
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  def animal_production
    @productions = @animal.productions.order(id: :desc).page params[:page]
  end

  def animal_development
    @developments = @animal.developments.order(id: :desc).page params[:page]
  end

  def animal_reproduction
    @reproductions = @animal.reproductions.order(id: :desc).page params[:page]
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_reproduction
      Reproduction.all
      #Reproduction.all.map{|i| {id: i.id, parturition: i.parturition, mother: i.mother.name, father: i.father.name}}
    end

    def animal_params
      params.require(:animal).permit(:code, :name, :photo, :description, :female, :breed, :lot_id, :reproduction_id, :discard, :reason_discard, :user_id)
    end
end
