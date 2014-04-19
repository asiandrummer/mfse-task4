require 'spec_helper'

describe "Assigment tests", :js => true, :type => :feature do

  Capybara.default_wait_time = 5
  Capybara.default_driver = :selenium


  #before :all do
    # seed our database with test lifecycle and phases
  #  load  "#{Rails.root}/db/seeds.rb"
  #end

  it "Able to visit manage assignment and new assignment pages" do

    visit   'http://localhost:3000/courses/semester/Spring2014'
    page.should have_content("Metrics for Software Engineers")
    click_link ("Course Tools")

    page.should have_content("Manage Assignments")

    click_link "Manage Assignments"
    page.should have_content("New Assignment")
    click_link "New Assignment"

    page.should have_content("Name")
    page.should have_content("Type")
    page.should have_content("Maximum Points*")
    page.should have_content("Due date")
 end


  it "Able to add a  new assignment " do

    visit   'http://localhost:3000/courses/semester/Spring2014'

    click_link ("Course Tools")

    click_link "Manage Assignments"
    click_link "New Assignment"

    fill_in "Name", :with => 'Team Coupling Assignment'
    fill_in "Abbreviation", :with => 'TC'
    choose 'Individual Deliverable'
    choose 'Yes'
    fill_in 'Maximum Points*' , :with =>'100'
    fill_in 'due_date_date' , :with =>'2014-5-6'
    click_button "Create Assignment"
    page.should have_content("Team Coupling Assignment")
  end

  def signin()
    page.should have_content("Email")
    fill_in "Email", :with => 'testuser@test.com'
    fill_in "Password", :with => 'test123123'
    click_button "Sign in"
  end

end


