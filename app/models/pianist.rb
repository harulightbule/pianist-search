class Pianist < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :school
    validates :repert
    validates :area
    validates :money
  end

end