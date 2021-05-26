class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :delete_all
  has_many :reactions, dependent: :delete_all
  has_many :likes, -> { where reactions: {like: true} }, class_name: "Reaction"
  has_many :dislikes, -> { where reactions: {like: false} }, class_name: "Reaction"
  has_many :answers, through: AnswerUser
  scope :subscribed, -> { where("subscription_email is not null or subscription_email != ''") }

  mount_uploader :avatar, AvatarUploader

  ROLE_ADMIN = "admin"
  ROLE_USER = "user"

  PER_PAGE = 20

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    role == ROLE_ADMIN
  end

  def self.get_roles
    [ROLE_ADMIN, ROLE_USER]
  end

  def self.filtered_list(params)
    query = order(:created_at)
    unless params[:role].nil? || ![ROLE_ADMIN, ROLE_USER].include?(params[:role])
      query = query.where(role: params[:role])
    end
    unless params[:enabled].nil?
      query = query.where(enabled: params[:enabled])
    end
    unless params[:online].nil?
      query = query.where(online: params[:online])
    end
    query.paginate(page: params[:page], per_page: PER_PAGE)
  end
end
