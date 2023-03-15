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
end
