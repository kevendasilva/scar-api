class UpdatesController < ApplicationController
  # GET /updates
  def index
    @updates = Update.where(door_lock_id: update_params[:door_lock_id])
  end

  # POST /updates
  def create
    @update = Update.new(update_params)

    if @update.save
      render @update, status: :created
    else
      render json: @update.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def update_params
      params.require(:update).permit(:key_type, :person_name, :open, :door_lock_id)
    end
end
