class Profile < ApplicationRecord
  belongs_to :profileable, polymorphic: true

  mount_uploader :image, ImageUploader

  VALID_GENDERS = ["Male", "Female"]
  START_YEAR = 1900
  VALID_DATES = DateTime.new(START_YEAR)..DateTime.now

  #validates :gender, inclusion: {in: VALID_GENDERS, allow_nil: true, message: "must be male or female"}
  #validates :date_of_birth, inclusion: {in: VALID_GENDERS, allow_nil: true, message: "is invalid!"}
end