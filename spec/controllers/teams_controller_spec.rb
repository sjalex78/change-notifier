# frozen_string_literal: true

require "rails_helper"

describe TeamsController, :isolated do
  describe "GET index" do
    it "returns success" do
      get :index
      expect(response.status).to eq 200
    end

    it "variable called teams" do
      allow(Team).to receive(:all).and_return([:team1, :team2])
      get :index
      expect(assigns(:teams)).to eq([:team1, :team2])
    end
  end

  describe "POST create" do
    let(:team_stub) { instance_double(Team) }

    before do
      allow(Team).to receive(:new).and_return(team_stub)
    end

    context "with a successful save" do
      before do
        allow(team_stub).to receive(:save).and_return(true)
      end

      it "redirects to index page" do
        post :create, params: {team: {name: "the name", url: "the url"}}
        expect(response.status).to eq 302
        expect(response).to redirect_to "/"
        expect(controller.request.flash[:notice]).to eq "Team was successfully created."
      end

      it "creates the team" do
        post :create, params: {
          team: {
            name: "the name", url: "the url", another: "ignore this"
          },
        }
        expect(Team).to have_received(:new).with(
          # name: "the name", url: "the url",
          hash_including(name: "the name", url: "the url"),
        )
        expect(team_stub).to have_received(:save)
      end
    end

    context "with save failing" do
      let(:error_stub) { instance_double(ActiveModel::Errors) }

      before do
        allow(team_stub).to receive(:save).and_return(false)
        allow(team_stub).to receive(:errors).and_return(error_stub)
        allow(error_stub).to receive(:full_messages).and_return(["error 1", "error 2"])
      end

      it "renders the new page with error message and unprocessable exception" do
        post :create, params: {team: {name: "the name", url: "the url"}}
        expect(response.status).to eq 422
        expect(flash[:alert]).to match("error 1 and error 2")
      end
    end
  end
end
