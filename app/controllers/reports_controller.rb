class ReportsController < ApplicationController
  def index
  	@classifications = Classification.all
  	@priorities = Priority.all


  		# Get all flaws groups by priority
 	@fbphash=Flaw.group(:priority).count
 	priorityhash={}

 	# Get all priorities
 	@priorities.each { |priobj|
 		priorityhash[priobj.prioritynumber]=priobj.priorityname
 	}
 	# remap priorities from integers to mnemonic : High, med,. low .etc...
    @fbphash.keys.each { |k| 
    		@fbphash[ priorityhash[k] ] = @fbphash.delete(k) if priorityhash[k]
	}


    @fbchash=Hash.new
    @classifications = Classification.all
    
    @classifications.each do |cl|
      @fbchash[cl.title] = (cl.flaws.any?) ? cl.flaws.count : 0
    end

  end
end
