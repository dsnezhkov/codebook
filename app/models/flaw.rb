class Flaw < ActiveRecord::Base
  belongs_to :classification

	searchable do
	  text :title
	  text :description
	  text :classification do
	    classification.title
	  end
	end

end
