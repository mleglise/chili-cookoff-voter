class User < ActiveRecord::Base
  rolify
  validates_presence_of :name

  has_many :attendances
  has_many :events, through: :attendances
  has_many :entries, foreign_key: :owner_id, inverse_of: :owner
  has_many :ratings

  # Commented out because not working in Rails 4
  # attr_accessible :role_ids, :as => :admin
  # attr_accessible :provider, :uid, :name, :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def guest_type_for(event)
    attendances.where(event: event).first.try(:guest_type)
  end

  def dishes_for(event)
    entries.where(event: event)
  end

  def rating_for(entry)
    ratings.find_by(entry: entry)
  end

end
