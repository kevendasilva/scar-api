class CurrentUserController < ApplicationController
  def index
    @user = current_user

    render :index, status: :ok
  end
end
