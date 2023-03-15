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
      before do
        allow(team_stub).to receive(:save).and_return(false)
      end

      it "renders the new page with error message and unprocessable exception"
      # expect(response.status).to eq 422
      # expect(controller.request.flash[:error]).to eq "some error"
    end
  end
end
