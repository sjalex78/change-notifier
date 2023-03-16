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
      pending "waiting for add team form embedded on landing page"
      # page.find("a", text: "Add team").click
      # @add_team_form.submit!(name: "john", url: "the url")
      page.fill_in("Name", with: "John Rep")
      page.fill_in("Url", with: "the-rep-url")
      page.find("[type=submit]").click
    end

    Then "they see the team was successfully added" do
      expect(page.find_all("p").first.text).to eq "Team was successfully created."
    end

    When "they add 2 more teams" do
      # page.find("a", text: "Back to teams").click
      # page.find("a", text: "Add team").click
      page.fill_in("Name", with: "Jenny Rep")
      page.fill_in("Url", with: "the-rep-2-url")
      page.find("[type=submit]").click
    end

    # And "they visit the main page" do
    #   page.find("a", text: "Back to teams").click
    # end

    Then "they see all 3 teams are added on the page as a list" do
      expect(
        page.find_all("#teams div").map(&:text),
      ).to eq [
        "Name: John Rep\nUrl: the-rep-url",
        "Name: Jenny Rep\nUrl: the-rep-2-url",
      ]
    end
  end
end
