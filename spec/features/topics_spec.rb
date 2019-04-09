require 'rails_helper'

RSpec.describe 'Forum', type: :feature do
  let!(:user) { create(:user) }

  describe 'visitor' do
    let!(:topic) { create :topic, user: user }

    it 'can see the Topics page' do
      visit root_path
      expect(page).to have_content('Topic')
    end

    it 'can sign up' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', with: 'user1@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('You have signed up successfully')
    end

    it 'can see posts made by certain user', js: true do
      visit root_path
      click_link user.email
      expect(page).to have_content("Profile for #{user.email}")
    end

    it 'can see one topic', js: true do # <= screenshot
      visit root_path
      click_link 'Topic'
      expect(page).to have_content("Topic")
    end
  end

  describe 'user' do
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
