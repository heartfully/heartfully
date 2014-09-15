require 'rails_helper'

RSpec.describe "Registries", :type => :request do
  describe "GET /registries" do
    it "works! (now write some real specs)" do
      get registries_path
      expect(response).to have_http_status(200)
    end
  end
end
