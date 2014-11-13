class Post < ActiveRecord::Base
  belongs_to :user

  validates :product_name, presence: true, uniqueness: true
  validates :url, presence: true
  validates :tagline, presence: true, length: { in: 10..80}

end
