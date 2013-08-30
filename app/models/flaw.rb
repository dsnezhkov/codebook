class Flaw < ActiveRecord::Base
  belongs_to :classification
  validates :title, presence: true
  
	searchable do
	  text :title, :stored => true
	  text :description, :stored => true
	end

end
