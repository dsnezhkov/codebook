class ReportsController < ApplicationController
  def index
  	@classifications = Classification.all
  	@priorities = Priority.all
  end
end
