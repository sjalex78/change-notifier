# frozen_string_literal: true

require 'change_notifier'

RSpec.describe ChangeNotifier do
  describe 'integration spec' do
    it 'finds updates and notifies about them' do
      VCR.use_cassette('team_005e3afb') do
        change_notifier = described_class.new(
          [
            # { team_id: '5712cf70', calendar_id: nil, messenger_id: nil },
            { team_id: '005e3afb', calendar_id: nil, messenger_id: nil },
          ],
        )
        expect(change_notifier.notifications).to match(
          array_including(
            {
              provisionalDate: '2022-04-30',
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
  end
end
