class PetsController < ApplicationController
  def index
<<<<<<< HEAD
    pets = Pet.all # don't have a view, so no need to use instance variables

    # render json: pets.as_json(only: [:id, :name, :age, :human]) # another way to display the same message
    render json: pets.as_json(except: [:created_at, :updated_at]), status: :ok # status ok is the default, but be explicit
  end

  def create
    pet = Pet.new(pet_params)

    if pet.save
      render json: { id: pet.id }
    else
      render_error(:bad_request, pet.errors.messages)
    end
=======
    pets = Pet.all
    # render json: {want_some_pie: true}

    # render json: pets
    render json: jsonify(pets), status: :ok
    # render json: pets.as_json( except: [:created_at, :updated_at] )
>>>>>>> adagold/c10-edges

  end

  def show
    pet = Pet.find_by(id: params[:id])
    if pet
      render json: jsonify(pet)
    else
      # head :not_found
      # render json: {}, status: :not_found
      render_error(:not_found, { pet_id: ["no such pet"] })
    end
  end

<<<<<<< HEAD
  def show
    pet_id = params[:id]
    pet = Pet.find_by(id: pet_id)

    if pet
      render json: jsonify(pet)
    else
      # render json: {}, status: :not_found
      render_error(:not_found, {pet_id: ["No such pet"] } )
=======
  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: { id: pet.id }
    else
      render_error(:bad_request, pet.errors.messages)
>>>>>>> adagold/c10-edges
    end
  end

  private

<<<<<<< HEAD
    def pet_params
      params.require(:pet).permit(:name, :age, :human)
    end

    def jsonify(pet_data)
      return pet_data.as_json(only: [:id, :name, :age, :human])
    end
=======
  def pet_params
    params.require(:pet).permit(:name, :age, :human)
  end

  def jsonify(pet_data)
    return pet_data.as_json(only: [:id, :name, :age, :human] )
  end
>>>>>>> adagold/c10-edges
end
