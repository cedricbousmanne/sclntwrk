class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :communities
  dragonfly_accessor :photo


  def display_name
    return "#{firstname} #{lastname}" if firstname.present? && lastname.present?
    return "#{firstname}"             if firstname.present?
    return "#{email}"
  end
end
