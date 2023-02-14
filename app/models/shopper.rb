# frozen_string_literal: true

class Shopper < ApplicationRecord
  EMAIL_REGEX = /.+@.+\..+/ #check valididty of email

  has_many :orders, dependent: :nullify #if shpper is deleted, its order_id column will be set to null 

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :name, presence: true
  validates :nif, presence: true
end
