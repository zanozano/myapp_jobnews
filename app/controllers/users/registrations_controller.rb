class Users::RegistrationsController < Devise::RegistrationsController
  def new_registration
    @user = User.new
  end

  def create_registration
    build_resource(sign_up_params)

    if resource.save
      set_flash_message! :notice, :signed_up
      redirect_to root_path
    else
      redirect_to root_path
      clean_up_passwords resource
      set_minimum_password_length
      render :new_registration
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
