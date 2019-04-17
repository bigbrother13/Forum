require 'rails_helper'

RSpec.describe User do
  let!(:user) { create :user }

  let
  let
  let

  describe 'recent reponses' do
    it 'should be sorted by date' do
      expect(user.recent_responses).to eq([comment2, comment1, comment3])
    end
  end
end
