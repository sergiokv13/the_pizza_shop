require 'rails_helper'

RSpec.describe PizzasController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Pizza. As you add validations to Pizza, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes)  { {pizza_type_id: 1, cheese_id: 1, sauce_id: 1, crust_id: 1, size_id: 1} }

  let(:invalid_attributes) { {pizza_type: nil, cheese_id: nil, sauce_id: nil, crust_id: nil, size_id: nil} }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PizzasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  #Set the models needed for the relation
  def set_models
    PizzaType.create(name: "Hawaiana")
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

