# frozen_string_literal: true

require "rails_helper"

feature "add teams", :js do
  scenario "a parent adds 3 teams and views them" do
    When "a parent visits the app" do
      @landing_page = Pages::Landing.new
      @landing_page.load
    end

    Then "there is a title" do
      expect(@landing_page.title.text).to eq "Add my basketball team"
    end

    When "they add a team" do
      page.fill_in("Name", with: "John Rep")
      page.fill_in("Url", with: "http://the-rep-url")
      page.find("[type=submit]").click
    end

    Then "they see the team was successfully added" do
      expect(page.find("[data-testid=flash]")).to have_text "Team was successfully created."
    end

    And "the flash message is cleared" do
      page.refresh # currently only way to remove flash
    end

    When "they add 1 more team succesfully" do
      page.fill_in("Name", with: "Jenny Rep")
      page.fill_in("Url", with: "http://the-rep-2-url")
      page.find("[type=submit]").click
      expect(page).to have_content "Team was successfully created."
    end

    Then "they see all 2 teams are added on the page as a list" do
      expect(
        page.find_all("[data-testid=team]").map(&:text),
      ).to eq([
        "John Rep",
        "Jenny Rep",
      ])
    end
  end
end
