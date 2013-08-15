class Classification < ActiveRecord::Base
  has_many :flaws, dependent: :destroy
  
  validates :title,
    presence: true,
    length: { minimum: 5 }
end
