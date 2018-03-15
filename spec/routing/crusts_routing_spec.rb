require "rails_helper"

RSpec.describe CrustsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/crusts").to route_to("crusts#index")
    end


    it "routes to #show" do
      expect(:get => "/crusts/1").to route_to("crusts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/crusts").to route_to("crusts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/crusts/1").to route_to("crusts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/crusts/1").to route_to("crusts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/crusts/1").to route_to("crusts#destroy", :id => "1")
    end

  end
end
