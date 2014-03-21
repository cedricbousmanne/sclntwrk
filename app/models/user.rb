class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  dragonfly_accessor :photo

  has_many :community_user_links, inverse_of: :user
  has_many :communities, through: :community_user_links, inverse_of: :users

  has_many :publications, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  after_save :force_photo_fallback

  include PublicActivity::Common
  include CommunityMembership

  phony_normalize :phone_number,  :default_country_code => 'BE'
  phony_normalize :mobile_number, :default_country_code => 'BE'
  validates_plausible_phone :phone_number
  validates_plausible_phone :mobile_number

  acts_as_messageable

  def display_name
    return "#{firstname} #{lastname}" if firstname.present? && lastname.present?
    return "#{firstname}"             if firstname.present?
    return "#{email}"
  end

  def photo_fallback
    File.open(File.join(Rails.root, "app", "assets", "images", "default-avatar.png"))
  end

  def mailboxer_email(object)
    email
  end

  private

  def force_photo_fallback
    if photo.nil?
      self.photo = photo_fallback
      self.save
    end
  end

end
