# frozen_string_literal: true

class ChangeNotifier
  def initialize(team_configs)
    @team_configs = team_configs
  end

  def notifications # rubocop:disable Metrics/MethodLength
    [
      {
        provisionalDate: '2022-04-30',
        season: 'Winter 2022',
        games: {
          away: 'Eltham U09 Girls 06',
          home: 'Collingwood U09 Girls 02',
          time: '10:10:00',
          court: 'Court 2',
          venue_name: 'Collingwood College',
          venue_address: '10 McCutcheon Way',
          venue_suburb: 'Collingwood',
          venue_postcode: '3066',
        },
      },
    ]
  end
end
