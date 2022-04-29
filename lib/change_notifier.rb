# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

class ChangeNotifier
  def initialize(team_configs)
    @team_configs = team_configs
    @query = File.read(File.join(__dir__, '../config/team_fixture_query.txt'))
    @query.gsub!('\\u0021', "\u0021") # special characters not processed correctly
    @result = []
    process
  end
  # fetch data
  # process data
  # output data

  def notifications
    @result
  end

  def process_result(raw_result)
    {
      provisionalDate: raw_result.dig(
        'data',
        'discoverTeamFixture',
        0,
        'provisionalDate',
      ),
    }
  end

  def process
    @team_configs.each do |config|
      raw_result = fetch(config[:team_id])
      @result << process_result(raw_result)
    end
  end

  def fetch(team_id) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    uri = URI('https://api.playhq.com/graphql')
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      req = Net::HTTP::Post.new(uri)
      req['content-type'] = 'application/json'
      req['origin'] = 'https://www.playhq.com'
      req['tenant'] = 'basketball-victoria'
      req['user-agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) '\
                          'AppleWebKit/537.36 (KHTML, like Gecko) '\
                          'Chrome/87.0.4280.88 '\
                          'Safari/537.36'

      # The body needs to be a JSON string.
      req.body = JSON[
        {
          operationName: 'teamFixture',
          variables: {
            teamID: team_id,
          },
          query: @query,
        }
      ]
      http.request(req)
    end
    response_json = JSON.parse(res.body)
    raise response_json['errors'].inspect if response_json.key?('errors')

    response_json
  end
end
