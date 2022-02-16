class Task < ApplicationRecord
  default_scope { order(:position) }
  belongs_to :list, optional: false

  acts_as_list scope: :list
  validates_presence_of :subject
end
