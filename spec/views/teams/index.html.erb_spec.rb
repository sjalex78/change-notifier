# frozen_string_literal: true

require "rails_helper"

describe "teams/index.html.erb" do
  it "has a title" do
    render
    expect(rendered).to have_content "Add my basketball team"
  end
end
