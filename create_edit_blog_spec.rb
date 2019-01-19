require 'capybara/rspec'

Capybara.default_driver = :selenium # :selenium_chrome and :selenium_chrome_headless are also registered

describe "create and edit blog", type: :feature do

  before :each do
    #Open the homepage of blog
    visit('http://localhost:3000/articles') 
  end
  
  #This is test case for creating blog
  it "creates a new blog" do
      click_link 'New Article' #Click button to create a new blog
      fill_in 'Title', with: 'test001' #Input title of a blog
      fill_in 'Text', with: 'text001'  #Input body text of a blog
      click_button 'Create Article'  #Save this blog
      expect(page).to have_content 'successfully created' #Verify the new blog has been created successfully
  end

  #This is test case for editing blog
  it "edits an existing blog" do
     click_link 'Edit' #Click button to eidt a blog
     fill_in 'Title', with: 'test002' #Update the title
     fill_in 'Text', with: 'text002'  #Update the body text
     click_button 'Update Article' #Click button to update this blog
     expect(page).to have_content 'successfully updated' #Verify the new blog has been updated successfully
  end  

end
