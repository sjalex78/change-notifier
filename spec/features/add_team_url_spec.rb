# frozen_string_literal: true

require "rails_helper"

feature "add team url", :js do
  scenario "a parent adds 3 teams and views them" do
    When "a parent visits the app" do
      @landing_page = Pages::Landing.new
      @landing_page.load
    end
  end
end
