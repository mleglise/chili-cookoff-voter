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

  def destroy_all_votes
    attendances.destroy_all
    entries.destroy_all
    ratings.destroy_all
  end

  def attendance_for(event)
    attendances.find_by(event: event)
  end

  def guest_type_for(event)
    attendance_for(event).try(:guest_type)
  end

  def dishes_for(event)
    entries.where(event: event)
  end

  def rating_for(entry)
    ratings.find_by(entry: entry)
  end

  def success_pic
    all_images = Dir[Rails.root.join('app/assets/images/success/*.gif')]
    all_images.map! {|img_path| img_path.gsub(/.*\//,"") }
    which_img = self.id % all_images.length
    'success/' + all_images[which_img]
  end

end
