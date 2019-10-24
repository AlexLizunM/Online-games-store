# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:nickname) }
    it { should validate_length_of(:nickname).is_at_most(32) }
    it { should validate_uniqueness_of(:nickname) }
    it { should validate_presence_of(:email) }
    it { should allow_value('alexandrlizunm@gmail.com').for(:email) }
    it { should_not allow_value('alhamdulilyah').for(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
