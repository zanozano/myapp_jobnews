class Users::RegistrationsController < Devise::RegistrationsController
  def new_registration
    self.resource = resource_class.new
  end

  def create
    build_resource(sign_up_params)
    puts build_resource(sign_up_params)

    if resource.save
      set_flash_message! :notice, :signed_up
      redirect_to root_path
    else
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
