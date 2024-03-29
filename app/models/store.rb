class Store < ActiveRecord::Base
  attr_accessible :address, :contact_info, :currency, :description, :name,
    :short_description, :logo, :pictures_attributes, :opening_times_attributes,
    :products_attributes, :theme_attributes

  belongs_to :owner, class_name: User
  has_many :pictures, class_name: StorePicture
  has_many :opening_times
  has_many :products
  has_many :orders

  has_one :theme

  accepts_nested_attributes_for :pictures, allow_destroy: true
  accepts_nested_attributes_for :opening_times, allow_destroy: true
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :theme

  validates_presence_of :name, :address, :description, :currency

  scope :filter_by_user, lambda { |user| where(:owner_id => user.id) }

  mount_uploader :logo, LogoUploader

  geocoded_by :address
  after_validation :geocode

  extend FriendlyId
  friendly_id :name, use: :slugged

  def link_to_google_maps
    "https://maps.google.com/maps?q=" + CGI::escape(address)
  end
end
