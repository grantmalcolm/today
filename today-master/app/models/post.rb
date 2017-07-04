class Post < ActiveRecord::Base
  # schema relationships
  belongs_to :user
  has_and_belongs_to_many :tags
  # store most-recent first
  default_scope -> { order(created_at: :desc) }

  # must be created by a user
  validates :user_id, presence: true
  # must have short title
  validates :title, presence: true, length: { maximum: 30 }
  # not too many tags
  validates :taglist, length: { maximum: 30 }
  # at most one post per day
  validate :one_post_per_day

  # thedate column is there for the dB constraint in the index;
  # populate it from the creation date
  before_create :set_date_to_today

  # call-back to create the tag-post relationship
  # new tags will be created in the dB
  after_create do
    # split up the post's taglist
    post = Post.find_by(id: self.id)
    poststags = post.taglist.strip.split(/\s+/)
    # stick the tags back in, creating in dB if not already there
    poststags.uniq.map do |atag|
      tag = Tag.find_or_create_by(name: atag)
      post.tags << tag
    end
  end

  private

    # check whether user has laready posted today
    def one_post_per_day
      if (!user.posts.empty?) && user.posts.first.thedate == Date.current
        errors.add(:thedate, "You can post only once per day")
      end
    end

    # populate the date column from created_at time
    def set_date_to_today
      self.thedate = Date.current
    end
end
