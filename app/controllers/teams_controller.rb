# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to "/", notice: "Team was successfully created."
  end

  private

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :url)
  end
end
