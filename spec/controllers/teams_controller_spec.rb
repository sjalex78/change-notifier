# frozen_string_literal: true

require "rails_helper"

describe TeamsController, :isolated do
  describe "GET index" do
    # render default template
    it "returns sucess" do
      get :index
      expect(response.status).to eq 200
    end
  end
end
