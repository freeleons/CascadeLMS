class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :course
  
  validates_presence_of :user_id, :body, :ip
  
  before_save :transform_markup
  
  def summary_date
    created_at.to_date.to_formatted_s(:short)
  end
  
  def feed_action
    "Comment Posted"
  end
  
  def acronym
     'Comment'
  end
  
  def summary_action
    'posted by:'
  end
  
  def summary_title
    "re: #{self.post.title}"
  end
  
  def summary_actor
    self.user.display_name
  end
  
  def icon
    'comment.png'
  end
  
  def transform_markup
	  self.body_html = HtmlEngine.apply_textile( self.body )
  end
  
  protected :transform_markup
  
end
