class AnimalsController < ApplicationController
  # GET /animals

  def index
    # To get /animals?species. Start with species/object/variable from the parameters
    species = params[:species]

    # If variable is not nil or false
    if species.present?
      # Code below is for Exact match only (capital included)
      # @animals = Animal.where(species: species)

      # Code below is for partial match
      @animals = Animal.where("species ilike ?", "%#{species}%")

    else
      @animals = Animal.all
    end

    render json: @animals
  end


  def show
    @animal = Animal.find(params[:id])

    render json: @animal
    
  end

  

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  def update
    @animal = Animal.find(params[:id])

    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  def destroy
    @animal = Animal.find(params[:id])

    @animal.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def animal_params
    params.require(:animal).permit(:species, :last_seen_location, :seen_count)
  end
end