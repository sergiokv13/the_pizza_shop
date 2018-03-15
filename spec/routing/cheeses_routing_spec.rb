require "rails_helper"

RSpec.describe CheesesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cheeses").to route_to("cheeses#index")
    end


    it "routes to #show" do
      expect(:get => "/cheeses/1").to route_to("cheeses#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cheeses").to route_to("cheeses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cheeses/1").to route_to("cheeses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cheeses/1").to route_to("cheeses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cheeses/1").to route_to("cheeses#destroy", :id => "1")
    end

  end
end
