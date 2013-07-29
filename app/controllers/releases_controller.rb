class ReleasesController < ApplicationController

  before_action :set_application
  before_action :set_release, only: [:show, :edit, :update, :destroy]

  def index
    @releases = @application.releases
  end

  def show
  end

  def new
    @release = Release.new(application: @application)
  end

  def edit
  end

  def create
    @release = Release.new(release_params)

    respond_to do |format|
      if @release.save
        format.html { redirect_to @release, notice: 'Version was successfully created.' }
        format.json { render action: 'show', status: :created, location: @release }
      else
        format.html { render action: 'new' }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to @release, notice: 'Version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_release
    @release = Release.find(params[:id])
  end

  def set_application
    @application = Application.find(params[:application_id]) if params[:application_id]
  end

  def release_params
    params.require(:release).permit(:name, :number, :changelog, :application_id, :deployable)
  end

end
