require "rails_helper"

RSpec.describe NonPizzasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/non_pizzas").to route_to("non_pizzas#index")
    end


    it "routes to #show" do
      expect(:get => "/non_pizzas/1").to route_to("non_pizzas#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/non_pizzas").to route_to("non_pizzas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/non_pizzas/1").to route_to("non_pizzas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/non_pizzas/1").to route_to("non_pizzas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/non_pizzas/1").to route_to("non_pizzas#destroy", :id => "1")
    end

  end
end
