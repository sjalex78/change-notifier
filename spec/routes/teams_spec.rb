# frozen_string_literal: true

require "rails_helper"

RSpec.describe "routes for Teams", type: :routing do
  it "routes / to the teams controller" do
    expect(get("/")).to route_to("teams#index")
  end

  it "routes form post /teams to teams create action" do
    expect(post("/teams")).to route_to("teams#create")
  end
end
