require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
  before do
    Post.create(name: 'Image1')
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('Image1')
    expect(page).not_to have_content('No posts yet')
  end
end

end