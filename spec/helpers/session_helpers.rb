module SessionHelpers 

  def sign_up
    visit('/')
    save_and_open_page
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_another
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'testy@example.com')
    fill_in('Password', with: 'testytesty')
    fill_in('Password confirmation', with: 'testytesty')
    click_button('Sign up')
  end

  def edit_post
    click_link('editKFC')
  end

  def make_post
    click_link 'Add Image'
    fill_in 'Name', with: 'Image1'
    click_button 'Create Post'
  end

  def leave_review
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
  end 

end