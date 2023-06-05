class UsersController < ApplicationController
  def jobs
    @user_jobs = current_user.jobs
  end
end
