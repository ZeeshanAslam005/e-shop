# frozen_string_literal: true

class Merchant < ApplicationRecord
  EMAIL_REGEX = /.+@.+\..+/ #check valididty of email
  has_many :orders, dependent: :destroy

  validates :cif, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :name, presence: true
end
