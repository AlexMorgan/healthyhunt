class Post < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes,
    dependent: :destroy
  has_many :comments,
    dependent: :destroy


  validates :product_name, presence: true, uniqueness: true
  validates_formatting_of :url, using: :url, allow_blank: false
  validates :tagline, presence: true, length: { in: 10..80}

  def upvote_from(user)
    upvotes.find_by(user_id: user.id)
  end

  # Create method to find whether or not signed in user has liked a post
  def has_upvote_from(user)
    upvotes.find_by(user_id: user.id).present?
  end
end
