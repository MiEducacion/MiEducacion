# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Servers", type: :request do
  describe "get information from the server status" do
    it "returns a 200" do
      get "/server/status.json"
      expect(response.status).to eq(200)
    end
  end
end
