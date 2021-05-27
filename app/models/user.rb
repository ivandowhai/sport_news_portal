class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :delete_all
  has_many :reactions, dependent: :delete_all
  has_many :likes, -> { where reactions: {like: true} }, class_name: "Reaction"
  has_many :dislikes, -> { where reactions: {like: false} }, class_name: "Reaction"

  mount_uploader :avatar, AvatarUploader

  ROLE_ADMIN = "admin"
  ROLE_USER = "user"

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == ROLE_ADMIN
  end

  def self.get_roles
    [ROLE_ADMIN, ROLE_USER]
  end

  def self.filter(filter_by, value)
    return all unless "enabled" == filter_by
    where(filter_by => value)
  end
end
