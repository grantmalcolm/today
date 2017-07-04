class Tag < ActiveRecord::Base
  # tags posts
  has_and_belongs_to_many :posts
  # store in alphabetical order
  default_scope -> { order(name: :asc) }

  # don't allow special symbols in tags
  VALID_TAG_REGEX = /\A\s*\w[\w.-]*(\s\w[\w.-])*\z/
  validates :name, format: { with: VALID_TAG_REGEX }
end
