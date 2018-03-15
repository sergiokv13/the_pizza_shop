require 'rails_helper'

RSpec.describe SaucesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Sauce. As you add validations to Sauce, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { {name: "BBQ"} }
  let(:invalid_attributes) { {name: nil} }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SaucesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      sauce = Sauce.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      sauce = Sauce.create! valid_attributes
      get :show, params: {id: sauce.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Sauce" do
        expect {
          post :create, params: {sauce: valid_attributes}, session: valid_session
        }.to change(Sauce, :count).by(1)
      end

      it "renders a JSON response with the new sauce" do

        post :create, params: {sauce: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(sauce_url(Sauce.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new sauce" do

        post :create, params: {sauce: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes)   { {name: "Honey Mustard"} }

      it "updates the requested sauce" do
        sauce = Sauce.create! valid_attributes
        past_name = sauce.name
        put :update, params: {id: sauce.to_param, sauce: new_attributes}, session: valid_session
        sauce.reload
        expect(past_name).not_to be(sauce.name)      
      end

      it "renders a JSON response with the sauce" do
        sauce = Sauce.create! valid_attributes

        put :update, params: {id: sauce.to_param, sauce: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the sauce" do
        sauce = Sauce.create! valid_attributes

        put :update, params: {id: sauce.to_param, sauce: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested sauce" do
      sauce = Sauce.create! valid_attributes
      expect {
        delete :destroy, params: {id: sauce.to_param}, session: valid_session
      }.to change(Sauce, :count).by(-1)
    end
  end

end
