# frozen_string_literal: true

require "rails_helper"

describe "It works root rails demo page", :js do
  it "I have rails" do
    When "user visits the app" do
      @test_page = Pages::ItWorks.new
      @test_page.load
    end

    Then "user sees they are on rails" do
      expect(@test_page.rails_version.text).to match(/7.0.4/)
      expect(@test_page.ruby_version.text).to match(/3.1.3/)
    end
  end
end
