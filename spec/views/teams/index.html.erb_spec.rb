# frozen_string_literal: true

require "rails_helper"

describe "teams/index.html.erb" do
  before do
    @team = Team.new
  end

  it "has a title" do
    render
    h1_heading = Capybara.string(rendered).find("h1")
    expect(h1_heading.text).to eq "Add my basketball team"
  end

  it "input called name" do
    render
    name_field = Capybara.string(rendered).find('[data-testid="field-name"]')
    expect(name_field.find("label").text).to eq "Name"
    expect(name_field.find("label")["for"]).to eq "team_name" # for screen readers and page navigation
    expect(name_field.find("input")["id"]).to eq "team_name" # for screen readers and page navigation
    expect(name_field.find("input")["name"]).to eq "team[name]"
  end

  it "input called url" do
    render
    url_field = Capybara.string(rendered).find('[data-testid="field-url"]')
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
    expect(form["action"]).to eq teams_path
  end

  context "with no teams created" do
    it "renders an empty list" do
      render
      list = Capybara.string(rendered).find("[data-testid=teams-list]")
      expect(list.find("p").text).to eq "add a team!"
    end
  end

  context "with teams created" do
    before do
      @teams = [
        Team.new(name: "nameA", url: "http://urlA.com"),
        Team.new(name: "nameB", url: "http://urlB.com"),
      ]
    end

    it "renders list of added teams" do
      render
      h2_heading = Capybara.string(rendered).find("h2")
      expect(h2_heading.text).to eq "List of teams"
      list = Capybara.string(rendered).find_all("[data-testid=team]")
      expect(list.count).to eq 2
      expect(list.first.text).to have_content "nameA"
      expect(list.last.text).to have_content "nameB"
    end
  end
end
