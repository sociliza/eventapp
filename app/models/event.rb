class Event < ApplicationRecord

  #has_many :reviews
  belongs_to :category
  
  mount_uploader :image, ImageUploader
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
  	[
  	 :title,
  	 [:title, :created_at]
  	]
  end

  belongs_to :business
  has_one :place, as: :placeable
  accepts_nested_attributes_for :place, reject_if: :all_blank

  has_many :comments

  def self.search(params)
    events = Event.where(id: params[:category].to_i)
    events = events.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    events = events.place.near(params[:location], 20) if params[:location].present?
    events
  end
end
