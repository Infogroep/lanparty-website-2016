class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :blog_comments

  validates :content, presence: true
  validates :title, presence: true
  validates :user, presence: true
end
