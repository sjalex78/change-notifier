# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/teams" do
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
