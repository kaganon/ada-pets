class PetsController < ApplicationController
  def index
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

  end


  def show
    pet_id = params[:id]
    pet = Pet.find_by(id: pet_id)

    if pet
      render json: jsonify(pet)
    else
      # render json: {}, status: :not_found
      render_error(:not_found, {pet_id: ["No such pet"] } )
    end
  end

  private

    def pet_params
      params.require(:pet).permit(:name, :age, :human)
    end

    def jsonify(pet_data)
      return pet_data.as_json(only: [:id, :name, :age, :human])
    end
end
