class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
    @user_jobs = current_user.jobs
    @profile = current_user.profile || current_user.build_profile
  end

  def show
    redirect_to profile_path(current_user.profile)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    if @profile.save
      redirect_to profiles_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

def update
  @profile = Profile.find_by(id: params[:profile][:id])

  if @profile.update(profile_params)
    puts "Update action executed successfully!" # Mensaje de prueba
    redirect_to profiles_path, notice: 'Profile was successfully updated.'
  else
    render :edit
  end
end



  def destroy
    @profile.destroy
    redirect_to profiles_path, notice: 'Profile was successfully destroyed.'
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :profile_photo, :description, :user_id)
  end
end
