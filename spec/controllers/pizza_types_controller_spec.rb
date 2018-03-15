require 'rails_helper'

RSpec.describe PizzaTypesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PizzaType. As you add validations to PizzaType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { {name: "Hawaiana"} }
  let(:invalid_attributes) { {name: nil} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PizzaTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      pizza_type = PizzaType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      pizza_type = PizzaType.create! valid_attributes
      get :show, params: {id: pizza_type.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new PizzaType" do
        expect {
          post :create, params: {pizza_type: valid_attributes}, session: valid_session
        }.to change(PizzaType, :count).by(1)
      end

      it "renders a JSON response with the new pizza_type" do

        post :create, params: {pizza_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(pizza_type_url(PizzaType.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new pizza_type" do

        post :create, params: {pizza_type: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: "Veggie"} }

      it "updates the requested pizza_type" do
        pizza_type = PizzaType.create! valid_attributes
        past_name = pizza_type.name
        put :update, params: {id: pizza_type.to_param, pizza_type: new_attributes}, session: valid_session
        pizza_type.reload
         expect(past_name).not_to be(pizza_type.name)      
      end

      it "renders a JSON response with the pizza_type" do
        pizza_type = PizzaType.create! valid_attributes

        put :update, params: {id: pizza_type.to_param, pizza_type: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the pizza_type" do
        pizza_type = PizzaType.create! valid_attributes

        put :update, params: {id: pizza_type.to_param, pizza_type: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pizza_type" do
      pizza_type = PizzaType.create! valid_attributes
      expect {
        delete :destroy, params: {id: pizza_type.to_param}, session: valid_session
      }.to change(PizzaType, :count).by(-1)
    end
  end

end
