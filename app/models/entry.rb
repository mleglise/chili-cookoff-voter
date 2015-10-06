class Entry < ActiveRecord::Base
  belongs_to :event
  belongs_to :category
  belongs_to :owner,
    :class_name => 'User'

  has_many :ratings

  validates_presence_of :event, :name, :category

  def valid_ratings
    ratings.where('score IS NOT NULL')
  end

  def total_score
    valid_ratings.sum(:score)
  end

  def avg_score
    total_score / valid_ratings.count rescue 0
  end
end
