class Post < ApplicationRecord
  belongs_to :user, optional: true
  # commontable
  acts_as_commontable dependent: :destroy
end
