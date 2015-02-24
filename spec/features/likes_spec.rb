require 'rails_helper'

feature 'Liking Comments' do
  before do
    kfc = Post.create(name: 'Image')
    kfc.comments.create(comment: 'It was an abomination')
  end

  it 'a user can like a comment, which increments the like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end

end

feature 'Liking posts' do
  before do
    image = Post.create(name: 'Image')
  end

  it 'a user can like a post, which increments the like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end
end