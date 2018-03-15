require 'rails_helper'

RSpec.describe CheesesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Cheese. As you add validations to Cheese, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { {name: "Muzarella"} }
  let(:invalid_attributes) { {name: nil} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CheesesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      cheese = Cheese.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cheese = Cheese.create! valid_attributes
      get :show, params: {id: cheese.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cheese" do
        expect {
          post :create, params: {cheese: valid_attributes}, session: valid_session
        }.to change(Cheese, :count).by(1)
      end

      it "renders a JSON response with the new cheese" do

        post :create, params: {cheese: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(cheese_url(Cheese.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new cheese" do

        post :create, params: {cheese: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: "Parmezano"} }

      it "updates the requested cheese" do
        cheese = Cheese.create! valid_attributes
        past_name = cheese.name
        put :update, params: {id: cheese.to_param, cheese: new_attributes}, session: valid_session
        cheese.reload
        expect(past_name).not_to be(cheese.name)
      end

      it "renders a JSON response with the cheese" do
        cheese = Cheese.create! valid_attributes

        put :update, params: {id: cheese.to_param, cheese: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the cheese" do
        cheese = Cheese.create! valid_attributes

        put :update, params: {id: cheese.to_param, cheese: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cheese" do
      cheese = Cheese.create! valid_attributes
      expect {
        delete :destroy, params: {id: cheese.to_param}, session: valid_session
      }.to change(Cheese, :count).by(-1)
    end
  end

end
