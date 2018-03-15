require 'rails_helper'

RSpec.describe NonPizzasController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # NonPizza. As you add validations to NonPizza, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { {name: "Lasagna"} }
  let(:invalid_attributes) { {name: nil} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NonPizzasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      non_pizza = NonPizza.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      non_pizza = NonPizza.create! valid_attributes
      get :show, params: {id: non_pizza.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new NonPizza" do
        expect {
          post :create, params: {non_pizza: valid_attributes}, session: valid_session
        }.to change(NonPizza, :count).by(1)
      end

      it "renders a JSON response with the new non_pizza" do

        post :create, params: {non_pizza: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(non_pizza_url(NonPizza.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new non_pizza" do

        post :create, params: {non_pizza: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: "Salad"} }

      it "updates the requested non_pizza" do
        non_pizza = NonPizza.create! valid_attributes
        past_name = non_pizza.name
        put :update, params: {id: non_pizza.to_param, non_pizza: new_attributes}, session: valid_session
        non_pizza.reload
         expect(past_name).not_to be(non_pizza.name) 
      end

      it "renders a JSON response with the non_pizza" do
        non_pizza = NonPizza.create! valid_attributes

        put :update, params: {id: non_pizza.to_param, non_pizza: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the non_pizza" do
        non_pizza = NonPizza.create! valid_attributes

        put :update, params: {id: non_pizza.to_param, non_pizza: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested non_pizza" do
      non_pizza = NonPizza.create! valid_attributes
      expect {
        delete :destroy, params: {id: non_pizza.to_param}, session: valid_session
      }.to change(NonPizza, :count).by(-1)
    end
  end

end
