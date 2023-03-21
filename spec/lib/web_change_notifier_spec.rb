# frozen_string_literal: true

require "rails_helper"

RSpec.describe WebChangeNotifier do
  describe "integration spec" do
    it "finds updates and notifies about them" do
      VCR.use_cassette("team_5712cf70_and_005e3afb") do
        web_change_notifier = WebChangeNotifier.new(
          [
            {team_id: "5712cf70", calendar_id: nil, messenger_id: nil},
            {team_id: "005e3afb", calendar_id: nil, messenger_id: nil},
          ],
        )
        expect(web_change_notifier.notifications.dig(0, :rounds, 0)).to match(
          {
            gradeName: "Girls U08 D Grading",
            games: [{homeName: "Park-Orchards U08 Girls 01",
                     awayName: "Collingwood U08 Girls 02",
                     date: "2021-11-13",
                     time: "14:20:00",
                     court: "Court 2",
                     venueName: "Mullum Mullum Stadium",
                     venueAddress: "31 Springvale Road\nDonvale\nVIC",
                     latitude: "-37.768569",
                     longitude: "145.184097"}],
          },
        )
        expect(web_change_notifier.notifications.dig(0, :rounds).count).to eq(14)
      end
    end

    it "throws error if teams do not exist" do
      VCR.use_cassette("team_does_not_exist") do
        expect do
          WebChangeNotifier.new(
            [
              {team_id: "does_not_exist", calendar_id: nil, messenger_id: nil},
            ],
          )
        end.to raise_error UnprocessableException, "team has no fixture"
      end
    end

    it "throws error when response has errors" do
      VCR.use_cassette("response_with_errors") do
        expect do
          WebChangeNotifier.new(
            [
              {team_id: "with_errors", calendar_id: nil, messenger_id: nil},
            ],
          )
        end.to raise_error(
          UnprocessableException,
          "Bolt adapter map not found in container.",
        )
      end
    end

    it "throws error if graphql query is broken" do
      VCR.use_cassette("query_broken") do
        expect do
          WebChangeNotifier.new(
            [
              {team_id: "query_broken", calendar_id: nil, messenger_id: nil},
            ],
          )
        end.to raise_error(
          UnprocessableException,
          "Syntax Error: Cannot parse the unexpected character \"\\\\\".", # rubocop:disable Style/StringLiterals
        )
      end
    end

    context "with a timout error" do
      before do
        allow(Net::HTTP).to receive(:start).and_raise(Net::ReadTimeout.new)
      end

      it "throws error due to timeout" do
        expect do
          WebChangeNotifier.new(
            [
              {team_id: "timeout_error", calendar_id: nil, messenger_id: nil},
            ],
          )
        end.to raise_error(
          Net::ReadTimeout, "Net::ReadTimeout"
        )
      end
    end
  end
end
