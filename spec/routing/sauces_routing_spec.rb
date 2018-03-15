require "rails_helper"

RSpec.describe SaucesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sauces").to route_to("sauces#index")
    end


    it "routes to #show" do
      expect(:get => "/sauces/1").to route_to("sauces#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sauces").to route_to("sauces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sauces/1").to route_to("sauces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sauces/1").to route_to("sauces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sauces/1").to route_to("sauces#destroy", :id => "1")
    end

  end
end
