class List < ApplicationRecord
  has_many :tasks, -> { order(:position) }, dependent: :restrict_with_error

  validates_presence_of :name

  def to_s
    "#{name}"
  end
end
