require 'rails_helper'

RSpec.describe 'Topic page', type: :feature do
  describe 'Visitor' do
    it 'can see the Topics page' do
      visit root_path
      expect(page).to have_content('Topic')
    end
  end

  describe 'User' do
    it 'Can add a post' do
      sign_in user
      visit root_path
      click_link 'New post'
      click_button 'Create post'
      expect(page).to have_content('Post created')
    end
  end
end
