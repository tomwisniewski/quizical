require 'spec_helper'
require 'capybara/rails'

describe "UserStories", :type => :feature, :js => true do
  describe "GET /users", :type => :feature, :js => true do
    it "works! (now write some real specs)" do
      visit '/users'
      expect(page).to have_content 'Users#index'
    end
  end
end
