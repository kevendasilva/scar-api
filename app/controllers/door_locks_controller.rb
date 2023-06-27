class DoorLocksController < ApplicationController
  before_action :set_door_lock, only: %i[ show update destroy ]

  # GET /door_locks
  def index
    @door_locks = DoorLock.all
  end

  # GET /door_locks/1
  def show
  end

  # POST /door_locks
  def create
    @door_lock = DoorLock.new(door_lock_params)

    if @door_lock.save
      render :show, status: :created, location: @door_lock
    else
      render json: @door_lock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /door_locks/1
  def update
    if @door_lock.update(door_lock_params)
      render :show, status: :ok, location: @door_lock
    else
      render json: @door_lock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /door_locks/1
  def destroy
    if @door_lock.destroy
      render json: {
        message: "Door lock deleted successfully.",
      }, status: :ok
    else
      render json: {
        message: "Error deleting door lock."
      }, status: :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door_lock
      @door_lock = DoorLock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def door_lock_params
      params.require(:door_lock).permit(:name, :open, :user_id)
    end
end
