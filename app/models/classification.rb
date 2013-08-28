class Classification < ActiveRecord::Base
  has_many :flaws, :order => "priority ASC", dependent: :destroy
  
  validates :title,
    presence: true,
    length: { minimum: 5 }

   searchable do
	  text :affects, :stored => true
   end

end
