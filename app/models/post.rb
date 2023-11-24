# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  validates :body, presence: true
  validates :expires_on, presence: true
  validates :title, presence: true
  
  belongs_to :board

  scope :active, -> { where('expires_on IS NULL OR expires_on >= ?', Date.current) }
  scope :expired, -> { where('expires_on IS NULL OR expires_on < ?', Date.current) }
end
