class BlogComment < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :user

  validates :content, presence: true
  validates :blog_post, presence: true
  validates :user, presence: true
end
