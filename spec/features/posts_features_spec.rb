require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a posts' do
      visit '/posts'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add Image'
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

  context 'creating restaurants' do

    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/posts'
      click_link 'Add Image'
      fill_in 'Name', with: 'Image1'
      # save_and_open_page
      click_button 'Create Post'
      expect(page).to have_content 'Image1'
      expect(current_path).to eq '/posts'
    end

  end

  context 'viewing posts' do

    let!(:image){Post.create(name:'Image')}

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Image'
      expect(page).to have_content 'Image'
      p image.id
      expect(current_path).to eq "/posts/#{image.id}"
    end

  end

  context 'editing restaurants' do

    before {Post.create name: 'Image'}

    scenario 'lets a user edit image' do
      visit '/posts'
      click_link 'Edit Image'
      fill_in 'Name', with: '#Playing'
      click_button 'Update Post'
      expect(page).to have_content '#Playing'
      expect(current_path).to eq '/posts'
    end 

  end

  context 'deleting restaurants' do

    before {Post.create name: 'Play'}

    scenario 'remove the image when user clicks delete' do
      visit '/posts'
      click_link 'Delete Play'
      expect(page).not_to have_content 'Play'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end