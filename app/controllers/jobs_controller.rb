class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :apply]

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def apply
    if current_user.jobs.include?(@job)
      current_user.jobs.delete(@job)
      redirect_to profile_path, notice: 'Aplicación cancelada exitosamente.'
    else
      current_user.jobs << @job
      redirect_to profile_path, notice: 'Empleo aplicado exitosamente.'
    end
  end

  def cancel_application
    @job = Job.find(params[:id])
    current_user.jobs.delete(@job)
    redirect_to profile_path, notice: 'La aplicación ha sido cancelada y el empleo ha sido eliminado de tu lista.'
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to job_path(@job), notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job), notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: 'Job was successfully destroyed.'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
