# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/teams" do
  describe "POST /create" do
    context "with valid parameters" do
      let(:parameters) {
        {name: "Jane Rep Team", url: "http://www"}
      }

      it "creates a new Team" do
        pending "need create team model"
        expect {
          post teams_url, params: {team: parameters}
        }.to change(Team, :count).by(1)
      end
    end
  end
end
