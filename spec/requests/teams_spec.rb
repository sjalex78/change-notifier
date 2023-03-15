# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/teams" do
  describe "GET /" do
    context "with teams present" do
      before do
        Team.create!(name: "team a", url: "http://urla.com")
        Team.create!(name: "team b", url: "http://urlb.com")
      end

      it "returns all teams" do
        get root_path
        pending "teams need to be rendered on index page"
        expect(body).to include "team a"
        expect(body).to include "team b"
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:parameters) {
        {name: "Jane Rep Team", url: "http://www"}
      }

      it "creates a new Team" do
        expect {
          post teams_url, params: {team: parameters}
        }.to change(Team, :count).by(1)
      end
    end

    context "with invalid parameters" do
      let(:parameters) {
        {name: "Jane Rep Team", url: nil}
      }

      it "throws a warning for Url being blank" do
        post teams_url, params: {team: parameters}
        expect(body).to include "Url can&#39;t be blank"
      end
    end
  end
end
