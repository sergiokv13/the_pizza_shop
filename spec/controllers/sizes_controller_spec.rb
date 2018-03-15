require 'rails_helper'


RSpec.describe SizesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Size. As you add validations to Size, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { {name: "Small", slices: 4} }
  let(:invalid_attributes) { {name: nil} }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SizesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      size = Size.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      size = Size.create! valid_attributes
      get :show, params: {id: size.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Size" do
        expect {
          post :create, params: {size: valid_attributes}, session: valid_session
        }.to change(Size, :count).by(1)
      end

      it "renders a JSON response with the new size" do

        post :create, params: {size: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(size_url(Size.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new size" do

        post :create, params: {size: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: "Big", slices: 10} }

      it "updates the requested size" do
        size = Size.create! valid_attributes
        past_name = Size.name
        put :update, params: {id: size.to_param, size: new_attributes}, session: valid_session
        size.reload
        expect(past_name).not_to be(size.name) 
      end

      it "renders a JSON response with the size" do
        size = Size.create! valid_attributes

        put :update, params: {id: size.to_param, size: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the size" do
        size = Size.create! valid_attributes

        put :update, params: {id: size.to_param, size: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested size" do
      size = Size.create! valid_attributes
      expect {
        delete :destroy, params: {id: size.to_param}, session: valid_session
      }.to change(Size, :count).by(-1)
    end
  end

end
