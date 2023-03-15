#  frozen_string_literal: true

require "rails_helper"

RSpec.describe Team, type: :model do
  it "is valid with valid attributes" do
    team = Team.new(name: "team nickname", url: "www.www.com")
    expect(team).to be_valid
  end

  it "requires a name" do
    team = Team.new(name: nil)
    expect(team).not_to be_valid
  end

  it "requires a url" do
    team = Team.new(url: nil)
    expect(team).not_to be_valid
  end

  context "with database integration" do
    it "requires unique name" do
      Team.create!(name: "name", url: "hello")
      expect {
        Team.create!(name: "name", url: "unique")
      }.to raise_error ActiveRecord::RecordInvalid, /Name has already been taken/
    end

    it "requires unique url" do
      Team.create!(name: "name1", url: "unique")
      expect {
        Team.create!(name: "name", url: "unique")
      }.to raise_error ActiveRecord::RecordInvalid, /Url has already been taken/
    end
  end
end
