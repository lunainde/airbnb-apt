class Flat < ApplicationRecord
  belongs_to :user
  validates :title, :address, :flat_type, :size, :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

  # refer to schema:
  # t.string "title"
  # t.string "address"
  # t.string "flat_type"
  # t.integer "size"
  # t.decimal "price"
  # t.boolean "availability"
  # t.bigint "user_id", null: false
