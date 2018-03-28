class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  default_scope ->  { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :publish, presence: true

  

end
