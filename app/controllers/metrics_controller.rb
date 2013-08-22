class MetricsController < ApplicationController
  def index

  	# Get all flaws groups by priority
 	@fbphash=Flaw.group(:priority).count
 	priorityhash={}

 	# Get all priorities
 	Priority.all.each { |priobj|
 		priorityhash[priobj.prioritynumber]=priobj.priorityname
 	}
 	# remap priorities from integers to mnemonic : High, med,. low .etc...
    @fbphash.keys.each { |k| 
    		@fbphash[ priorityhash[k] ] = @fbphash.delete(k) if priorityhash[k]
	}

  	@fbshash=Flaw.group(:state).count

    @fbchash=Hash.new
    @classifications = Classification.all
    
    @classifications.each do |cl|
      @fbchash[cl.title] = (cl.flaws.any?) ? cl.flaws.count : 0
    end


  end
end
