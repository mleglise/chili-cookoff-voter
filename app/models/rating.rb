class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry

  validates_presence_of :user, :entry #, :score
  # Missing score indicates null vote. Should not be counted.

  # You can only vote for each entry once
  validates_uniqueness_of :user_id, scope: :entry_id
end
