class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  has_and_belongs_to_many :communities
  dragonfly_accessor :photo
  has_many :publications, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  after_save :force_photo_fallback

  include PublicActivity::Common

  def display_name
    return "#{firstname} #{lastname}" if firstname.present? && lastname.present?
    return "#{firstname}"             if firstname.present?
    return "#{email}"
  end

  def photo_fallback
    File.open(File.join(Rails.root, "app", "assets", "images", "default-avatar.png"))
  end

  def force_photo_fallback
    if photo.nil?
      self.photo = photo_fallback
      self.save
    end
  end

end
