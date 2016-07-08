class Event < ApplicationRecord

  # ordering
  default_scope -> {order(start_date: "DESC")}

  # validation
  validate :event_start_cannot_be_in_the_part

  #has_many :reviews
  belongs_to :category
  
  mount_uploader :image, ImageUploader
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

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

  has_many :invites, dependent: :destroy
  has_many :guests, through: :invites, source: :user

  scope :upcoming, -> { where("start_date >= ?", Date.today).order('start_date ASC') }
  scope :past, -> { where("end_date < ?", Date.today).order('end_date DESC') }
  scope :current_events, -> { where("start_date  == ?", Date.today)}

  def event_start_cannot_be_in_the_part
    errors.add(:start_date, "can't be in the past") if !start_date.blank? and start_date < Date.today
  end

  def self.search(params)
    events = Event.where(id: params[:category].to_i)
    events = events.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    events = events.place.near(params[:location], 20) if params[:location].present?
    events
  end
end
