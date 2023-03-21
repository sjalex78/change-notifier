# frozen_string_literal: true

require "web_change_notifier"
class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to "/", notice: "Team was successfully created."
    else
      flash.now[:alert] = @team.errors.full_messages.to_sentence
      render :index, status: :unprocessable_entity
    end
  end

  def is_url_unique
    render json: {query: params[:q], unique: !Team.exists?(url: params[:q])}
  end

  def fetch_fixture
    # TODO: team_id needs to be parsed from URL
    web_change_notifier = WebChangeNotifier.new([{team_id: "655fb015"}])
    render json: web_change_notifier.notifications
  end

  private

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :url)
  end
end
