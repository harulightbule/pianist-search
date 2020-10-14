class Comment < ApplicationRecord
  belongs_to :pianist
  belongs_to :user
end
