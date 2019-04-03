require 'rails_helper'

RSpec.describe 'Topic page', type: :feature do
  describe 'Visitor' do
    let!(:topic) { create :topic }

    it 'can see the Topics page' do
      visit root_path
      expect(page).to have_content('Topic')
    end

    it 'Should create user' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', with: 'user1@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('You have signed up successfully')
    end
  end

  describe 'User' do
    let!(:user) { create(:user) }

    it 'Can add a topic' do
      sign_in user
      visit root_path
      click_link 'New Topic'
      fill_in 'Title', with: 'Topic'
      fill_in 'Content', with: 'Some text'
      click_button 'Create Topic'
      expect(page).to have_content('* * * Create success * * *')
    end
  end
end
