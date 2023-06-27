class SearchController < ApplicationController
  def client_by_key
    client = Client.where(
                door_lock_id: client_by_key_params[:door_lock_id],
                key: client_by_key_params[:key])

    if not client.empty?
      render client.first
    else
      render json: {
        message: "The client was not found."
      }, status: :not_found
    end
  end

  private

  def client_by_key_params
    params.require(:client).permit(:key, :door_lock_id)
  end
end
