require 'capybara/rspec'

Capybara.default_driver = :selenium # :selenium_chrome and :selenium_chrome_headless are also registered

describe "create and edit blog", type: :feature do

  before :each do
    visit('http://localhost:3000/articles')
  end

  it "creates a new blog" do
      click_link 'New Article'
      fill_in 'Title', with: 'test001'
      fill_in 'Text', with: 'text001'  
      click_button 'Create Article'
      expect(page).to have_content 'successfully created' #Verify the new blog has been created successfully
  end

  it "edits an existing blog" do
     click_link 'Edit'
     fill_in 'Title', with: 'test002'
     fill_in 'Text', with: 'text002'  
     click_button 'Update Article'
     expect(page).to have_content 'successfully updated' #Verify the new blog has been updated successfully
  end  

end