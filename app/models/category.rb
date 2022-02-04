class Category < ApplicationRecord
  has_many :people, dependent: :restrict_with_error
end
