class MetricsController < ApplicationController
  def index
    @fbchash=Hash.new
    @fbphash=Hash.new
    @classifications = Classification.all
    
    @classifications.each do |cl|
      @fbchash[cl.title] = (cl.flaws.any?) ? cl.flaws.count : 0
    end

  end
end
