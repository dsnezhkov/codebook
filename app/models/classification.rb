class Classification < ActiveRecord::Base
  has_many :flaws, :order => "priority ASC", dependent: :destroy
  
  validates :title,
    presence: true,
    length: { minimum: 5 }



  searchable do
    text :title
    text :flaws do
      flaws.map { |flaw| flaw.title }
    end

  end

end
