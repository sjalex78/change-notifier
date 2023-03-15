# frozen_string_literal: true

require "rails_helper"

describe "It works root rails demo page", :js do
  it "I have rails" do
    When "user visits the app" do
      visit test_root_rails_path
    end

    Then "user sees they are on rails" do
      expect(page.find("ul li", text: "Rails version").text).to match(/7.0.4/)
      expect(page.find("ul li", text: "Ruby version").text).to match(/ruby 3.2.1/)
    end
  end
end
