class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :company, :password, :current_password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :copmany, :password, :current_password, :password_confirmation)
  end
end