class SearchController < ApplicationController
  def index

    if ( params.has_key?(:search) && ( not params[:search].blank?) )
      @search=Sunspot.search(Flaw) do
        keywords params[:search], :highlight => true
      end
      
      @flaws= @search.results
    else
    	redirect_to classifications_path
    end
  end
end
