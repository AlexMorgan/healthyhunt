class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:voteable_type, :voteable_id] }

  # Get the context of the vote (Is it a post-vote or a comment-vote)
  def self.context(params)
    if params[:post_id]
      id = params[:post_id]
      Post.find(params[:post_id])
    else
      id = params[:comment_id]
      Comment.find(params[:comment_id])
    end
  end
end
