class Category < ApplicationRecord
  has_many :people, dependent: :restrict_with_error
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def to_s
    "#{name}"
  end
end
