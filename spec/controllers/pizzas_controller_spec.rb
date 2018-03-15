require 'rails_helper'

RSpec.describe PizzasController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Pizza. As you add validations to Pizza, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes)  { {pizza_type: Faker::Food, cheese_id: 1, sauce_id: 1, crust_id: 1, size_id: 1} }

  let(:invalid_attributes) { {pizza_type: nil} }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PizzasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  #Set the models needed for the relation
  def set_models
    Cheese.create(name:"Muzarela")
    Sauce.create(name: "BBQ")
    Crust.create(name: "Thin")
    Size.create(name: "Small", slices: 4)
  end


  describe "GET #index" do

    before(:each) do
       set_models
    end

    it "returns a success response" do
      pizza = Pizza.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do

    before(:each) do
       set_models
    end

    it "returns a success response" do
      pizza = Pizza.create! valid_attributes
      get :show, params: {id: pizza.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do

    before(:each) do
       set_models
    end

    context "with valid params" do
      it "creates a new Pizza" do
        expect {
          post :create, params: {pizza: valid_attributes}, session: valid_session
        }.to change(Pizza, :count).by(1)
      end

      it "renders a JSON response with the new pizza" do

        post :create, params: {pizza: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(pizza_url(Pizza.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new pizza" do

        post :create, params: {pizza: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do

    before(:each) do
       set_models
    end

    context "with valid params" do
      let(:new_attributes) { {pizza_type: Faker::Food} }

      it "updates the requested pizza" do
        pizza = Pizza.create! valid_attributes
        past_type = pizza.pizza_type
        put :update, params: {id: pizza.to_param, pizza: new_attributes}, session: valid_session
        pizza.reload
         expect(past_type).not_to be(pizza.pizza_type)
      end

      it "renders a JSON response with the pizza" do
        pizza = Pizza.create! valid_attributes

        put :update, params: {id: pizza.to_param, pizza: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the pizza" do
        pizza = Pizza.create! valid_attributes

        put :update, params: {id: pizza.to_param, pizza: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do

    before(:each) do
       set_models
    end

    it "destroys the requested pizza" do
      pizza = Pizza.create! valid_attributes
      expect {
        delete :destroy, params: {id: pizza.to_param}, session: valid_session
      }.to change(Pizza, :count).by(-1)
    end
  end

end

