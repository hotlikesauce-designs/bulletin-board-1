# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :posts

  scope :all_active_posts, -> { joins(:posts).merge(Post.active_or_expired) }
  scope :all_expired_posts, -> { joins(:posts).where('posts.expires_on < ?', Date.current) }
  
  def active_posts
    posts.active
  end
  
  def expired_posts
    posts.expired
  end
end
