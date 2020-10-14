class Pianist < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :image
    validates :school
    validates :repert
    validates :area
    validates :money
  end

def self.search(search)
  if search != ""
    Pianist.where('area LIKE(?)', "%#{search}%")
  else
     Pianist.all
  end
end

end
