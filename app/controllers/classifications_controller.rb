class ClassificationsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show]

  def index
    @charthash=Hash.new

    # Search or full index
    if ( params.has_key?(:search) &&  (not params[:search].empty?) )
      @search = Classification.search do
        fulltext params[:search]
      end
      @classifications = @search.results
    else
      @classifications = Classification.all
    end
    @classifications.each do |cl|
      @charthash[cl.title] = (cl.flaws.any?) ? cl.flaws.count : 0
    end
    
  end


  def show
    @classification = Classification.find(params[:id])

  end

  def edit
    @classification = Classification.find(params[:id])
  end

  def update
    @classification = Classification.find(params[:id])

    if @classification.update(classification_params)
      redirect_to action: :show, id: @classification.id
    else
      render 'edit'
    end
  end

  def new
    @classification = Classification.new
  end

  def create
    @classification = Classification.new(classification_params)

    if @classification.save
      redirect_to action: :show, id: @classification.id
    else
      render 'new'
    end
  end

  def destroy
    @classification = Classification.find(params[:id])
    @classification.destroy

    redirect_to action: :index
  end

  private

    def classification_params
      params.require(:classification).permit(:title, :overview, :guidance)
    end

end
