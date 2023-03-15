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
        # expect(web_change_notifier.notifications).to eq([])
        expect(web_change_notifier.notifications).to match(
          array_including(
            {
              provisionalDate: "2022-04-30",
              # season: 'Winter 2022',
              # games: {
              #   away: 'Eltham U09 Girls 06',
              #   home: 'Collingwood U09 Girls 02',
              #   time: '10:10:00',
              #   court: 'Court 2',
              #   venue_name: 'Collingwood College',
              #   venue_address: '10 McCutcheon Way',
              #   venue_suburb: 'Collingwood',
              #   venue_postcode: '3066',
              # },
            },
          ),
        )
      end
    end

    it "throws error if teams do not exist" do
      VCR.use_cassette("team_does_not_exist") do
        pending "error not thrown when no fixture is returned"
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
