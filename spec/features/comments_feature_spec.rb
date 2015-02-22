require 'rails_helper'

feature 'Commenting' do
  before {Post.create name: 'Play'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     # save_and_open_page
     click_link 'Comment on Play'
     fill_in "Comment", with: "Yeah baby"
     check 'Thumbsup'
     # save_and_open_page
     click_button 'Leave Comment'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('Yeah baby')
  end

end