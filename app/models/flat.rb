class Flat < ApplicationRecord
  belongs_to :user

  validates :title, :address, :flat_type, :size, :price, presence: true
end

  # refer to schema:
  # t.string "title"
  # t.string "address"
  # t.string "type"
  # t.integer "size"
  # t.decimal "price"
  # t.boolean "availability"
  # t.bigint "user_id", null: false
