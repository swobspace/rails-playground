class Post < ApplicationRecord
  include PostConcerns

  has_rich_text :content

  validates_presence_of :subject
  validates_presence_of :content

end
