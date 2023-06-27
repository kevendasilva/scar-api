class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show update destroy ]

  # GET /clients
  def index
    @clients = Client.where(door_lock_id: client_params[:door_lock_id])
  end

  # GET /clients/1
  def show
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render :show, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render :show, status: :ok, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    if @client.destroy
      render json: {
        message: "Client deleted successfully.",
      }, status: :ok
    else
      render json: {
        message: "Error deleting client."
      }, status: :no_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :key, :key_type, :allowed, :door_lock_id)
    end
end
