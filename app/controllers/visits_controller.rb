class VisitsController < ApplicationController
  def create
    @visit = Visit.create(create_params.merge(user_id: access_user.id))
    render json: { @visit }, status: :created
  end

  private

  def create_params
    params.require(:visit).permit(:state, :store_id)
  end
end
