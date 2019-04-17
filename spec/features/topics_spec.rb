require 'rails_helper'

RSpec.describe 'Forum', type: :feature do
  let!(:author) { create :user }
  let!(:topic)  { create :topic, user: author }
  let!(:topic2) { create :topic, user: author }
  let!(:comment1) { create :comment, user: author }
  let!(:comment2) { create :comment, user: author }

  describe 'visitor' do
    before do
      visit root_path
    end

    it 'can see the Topics page' do
      expect(page).to have_content('Topics')
    end

    it 'can sign up' do
      click_link 'Sign Up'
      fill_in 'Email', with: 'user1@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
      expect(page).to have_content('You have signed up successfully')
    end

    it 'can see profile of a certain user' do
      first(:link, author.email).click
      expect(page).to have_content("Profile for #{author.email}")
    end

    it 'can see all comments in topics of a certain user' do
      first(:link, author.email).click
      expect(page).to have_content(comment1.comment)
      expect(page).to have_content(comment2.comment)
      expect(page).not_to have_content(comment3.comment)
    end

    it 'can see one topic' do
      click_link topic.title
      expect(page).to have_content(topic.content)
    end

    it 'cannot add comments' do
      click_link topic2.title
      expect(page).not_to have_button('Create Comment')
    end
  end

  describe 'user' do
    let!(:user) { create :user }

    before do
      sign_in user
      visit root_path
    end

    it 'can add a topic' do
      click_link 'New Topic'
      fill_in 'Title', with: 'Topic'
      fill_in 'Content', with: 'Some text'
      click_button 'Create Topic'
      expect(page).to have_content('Topic was created')
    end

    it 'can add a comment' do
      click_link topic2.title
      fill_in 'Comment', with: 'Up!'
      click_button 'Create Comment'
      expect(page).to have_content("Comment was created")
    end

    it 'can see an error if comment is not valid' do
      click_link topic2.title
      click_button 'Create Comment'
      expect(page).to have_content("Comment can't be blank")
    end

    it 'can sign out' do
      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully')
    end
  end
end
