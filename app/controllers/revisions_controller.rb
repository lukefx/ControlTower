class RevisionsController < ApplicationController

  before_action :set_application

  def index
    @revisions = @application.revisions
  end

  def show
  end

  def new
    @revision = Revision.new(application: @application)
  end

  def edit
  end

  def create
    @revision = Revision.new(revision_params)

    respond_to do |format|
      if @revision.save
        format.html { redirect_to @revision, notice: 'Revision was successfully created.' }
        format.json { render action: 'show', status: :created, location: @revision }
      else
        format.html { render action: 'new' }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @revision.update(application_params)
        format.html { redirect_to @revision, notice: 'Revision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_revision
    @revision = Revision.find(params[:id])
  end

  def set_application
    @application = Application.find(params[:application_id]) if params[:application_id]
  end

  def revision_params
    params.require(:revision).permit(:name, :number, :changelog, :application_id, :deployable)
  end

end
