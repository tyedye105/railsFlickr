require 'rails_helper'

describe ImagesController do
  it "will show no pictures when there aren't any" do
    visit images_path
    expect(page).to have_content 'rFlik Login Sign Up There are no pictures'
  end

  it "will show all pictures" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    fill_in "Description", :with => "Something else"
    click_on 'Create Image'
    expect(page).to have_content 'Something'
  end

  it "will the show image" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    fill_in "Description", :with => "Something else"
    click_on 'Create Image'
    click_link 'Something'
    expect(page).to have_content 'Something'
  end

  it "will the edit" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    fill_in "Description", :with => "Something else"
    click_on 'Create Image'
    click_link 'Something'
    click_link 'Edit'
    fill_in "Title", :with => "Something Wonderful"
    click_on 'Update Image'
    expect(page).to have_content 'Something Wonderful'
  end

  it "will the destroy" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    fill_in "Description", :with => "Something else"
    click_on 'Create Image'
    click_link 'Something'
    click_link 'Delete'
    expect(page).to have_content 'no pictures'
  end

  it "will show an error if image creation didn't happen" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    click_on 'Create Image'
    expect(page).to have_content 'Add an image! Avatar Title Description'
  end

  it "will show edit form if it fails to update" do
    user = FactoryGirl.create(:user)
    visit images_path
    click_on 'Login'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add A picutre!'
    page.attach_file('image[avatar]', 'app/assets/images/dog.jpeg')
    fill_in "Title", :with => "Something"
    fill_in "Description", :with => "Something else"
    click_on 'Create Image'
    click_link 'Something'
    click_link 'Edit'
    fill_in "Title", :with => ""
    click_on 'Update Image'
    expect(page).to have_content 'Edit Image Details Avatar Title Description'
  end
end
