class Person < ApplicationRecord
  belongs_to :category, optional: true

  validates :sn, :givenname, presence: true
  validates :username, presence: true, uniqueness: {case_sensitive: true}
end
