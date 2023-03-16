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

  it "input called url" do
    render
    url_field = Capybara.string(rendered).find('label[for="team_url"]').find(:xpath, "..")
    expect(url_field.find("label").text).to eq "Url"
    expect(url_field.find("label")["for"]).to eq "team_url" # for screen readers and page navigation
    expect(url_field.find("input")["id"]).to eq "team_url" # for screen readers and page navigation
    expect(url_field.find("input")["type"]).to eq "url"
    expect(url_field.find("input")["name"]).to eq "team[url]"
  end

  it "renders a submit form button" do
    render
    submit = Capybara.string(rendered).find('input[type="submit"]')
    expect(submit["value"]).to eq "Add"
  end

  it "renders a form to add a team" do
    render
    form = Capybara.string(rendered).find("form")
    pending "waiting for route to create a team"
    expect(form["action"]).to eq teams_path
  end
end
