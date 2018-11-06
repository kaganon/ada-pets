class ApplicationController < ActionController::API
<<<<<<< HEAD
=======

>>>>>>> adagold/c10-edges
  def render_error(status, errors)
    render json: { errors: errors }, status: status
  end
end
