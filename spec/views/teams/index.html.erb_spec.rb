# frozen_string_literal: true

require "rails_helper"

describe "teams/index.html.erb" do
  it "has a title" do
    render
    h1_heading = Capybara.string(rendered).find("h1")
    expect(h1_heading.text).to eq "Add my basketball team"
  end

  it "input called name" do
    render
    name_field = Capybara.string(rendered).find('label[for="team_name"]').find(:xpath, "..")
    expect(name_field.find("label").text).to eq "Name"
    expect(name_field.find("label")["for"]).to eq "team_name" # for screen readers and page navigation
    expect(name_field.find("input")["id"]).to eq "team_name" # for screen readers and page navigation
    expect(name_field.find("input")["name"]).to eq "team[name]"
  end
end
