class FlawsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "password", only: :destroy

  def new
    @classification = Classification.find(params[:classification_id])
    @flaw = Flaw.new
  end

  def edit
    @classification = Classification.find(params[:classification_id])
    @flaw = @classification.flaws.find(params[:id])
  end

  def update
    @classification = Classification.find(params[:classification_id])
    @flaw = @classification.flaws.find(params[:id])

    ## Mass assignment is disabled. needto explicitly permit (ref: https://github.com/rails/strong_parameters )
    if @flaw.update_attributes(flaw_params)
      #redirect_to controller: :classifications, action: :show, id: @classification.id
      redirect_to action: :show, id: @flaw.id
    else
      render 'edit'
    end
  end

  def show 
    @classification = Classification.find(params[:classification_id])
    @flaw = @classification.flaws.find(params[:id])
  end

  def create
    @classification = Classification.find(params[:classification_id])
    @flaw = @classification.flaws.create(flaw_params)
    redirect_to classification_path(@classification)
  end

  def destroy
    @classification = Classification.find(params[:classification_id])
    @flaw = @classification.flaws.find(params[:id])
    @flaw.destroy
    redirect_to classification_path(@classification)
  end

  private

    def flaw_params
      params.require(:flaw).permit(:title, :description, :recommendation, :state)
    end
end
