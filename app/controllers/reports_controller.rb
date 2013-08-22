class ReportsController < ApplicationController
  def index
  	@classifications = Classification.all
  end
end
