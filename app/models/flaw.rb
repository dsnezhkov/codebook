class Flaw < ActiveRecord::Base
  belongs_to :classification

	searchable do
	  text :title, :stored => true
	  text :description, :stored => true
	end

end
