# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'associations' do
    it { should have_many(:orders) }
  end

  describe 'validations' do
    subject { create(:merchant) }

    include_examples 'email format' #email formatting test suites using shared examples

    it { should validate_presence_of(:cif) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:email) }
  end
end
