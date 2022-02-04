class Person < ApplicationRecord
  belongs_to :category, optional: true
end
