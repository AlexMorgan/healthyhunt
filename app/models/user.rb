class User < ActiveRecord::Base
  has_many :posts
  has_many :upvotes,
    dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true
end
