# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shopper, type: :model do
  describe 'associations' do
    it { should have_many(:orders) }
  end

  describe 'validations' do
    subject { create(:shopper) }

    include_examples 'email format'

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:nif) }

    it { should validate_uniqueness_of(:email) }
  end
end
