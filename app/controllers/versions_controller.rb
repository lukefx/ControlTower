class VersionsController < ApplicationController

  before_action :set_application

  def index
    @versions = @application.versions
  end

  def show
  end

  def new
    @version = Version.new(application: @application)
  end

  def edit
  end

  def create
    @versions = Version.new(version_params)

    respond_to do |format|
      if @version.save
        format.html { redirect_to @version, notice: 'Version was successfully created.' }
        format.json { render action: 'show', status: :created, location: @version }
      else
        format.html { render action: 'new' }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @version.update(application_params)
        format.html { redirect_to @version, notice: 'Version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_version
    @version = Version.find(params[:id])
  end

  def set_application
    @application = Application.find(params[:application_id]) if params[:application_id]
  end

  def version_params
    params.require(:version).permit(:name, :number, :changelog, :application_id, :deployable)
  end

end
