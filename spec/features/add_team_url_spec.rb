# frozen_string_literal: true

require "rails_helper"

feature "add team url", :js do
  scenario "a parent adds 3 teams and views them" do
    When "a parent visits the app" do
      @landing_page = Pages::Landing.new
      @landing_page.load
    end
    Then "there is a title" do
      # expect(@landing_page).to have_title
      expect(@landing_page.title.text).to eq "Add my basketball team"
    end
  end
end
