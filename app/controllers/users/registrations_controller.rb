# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    @user = current_user

    if resource.persisted?
      render :registration_success, status: :ok
    else
      render :registration_fail, status: :unprocessable_entity
    end
  end
end
