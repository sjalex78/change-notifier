# frozen_string_literal: true

json.extract! team, :id, :name, :url, :created_at, :updated_at
json.url team_url(team, format: :json)
