class Team < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, foreign_key: :subcategory_id, class_name: "Category"
  has_many :articles
  has_and_belongs_to_many :users
  mount_uploader :logo, LogoUploader

  validates :team, presence: true
  validates :category_id, presence: true
  validates :location, presence: true
  validates :logo, presence: true

  PER_PAGE = 20

  def self.filter(params)
    query = includes([:category, :subcategory])
    if params[:team]
      query = query.where("lower(team) like ?", "%#{params[:team]}%")
    end
    if params[:location]
      query = query.where("lower(location) like ?", "%#{params[:location]}%")
    end
    if params[:category_id]
      query = query.where(category_id: params[:category_id])
    end
    if params[:subcategory_id]
      query = query.where(subcategory_id: params[:subcategory_id])
    end
    query.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def self.find_by_name(team)
    where("lower(team) like ?", "%#{team}%")
      .includes(:users)
      .limit(10)
  end
end
