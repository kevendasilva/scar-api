# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update(account_update_params)
      render :update_success, status: :ok
    else
      render :update_fail, status: :unprocessable_entity
    end
  end

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
