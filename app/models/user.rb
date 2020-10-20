class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :pianist
  has_many :comments, dependent: :destroy

 with_options presence: true do
  validates :name
  validates :password, format: { with: /[a-z\d]{6,}/i }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, format: { with: /[a-z\d]{6,}/i }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
 end




  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
