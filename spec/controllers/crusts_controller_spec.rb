require 'rails_helper'


RSpec.describe CrustsController, type: :controller do



  # This should return the minimal set of attributes required to create a valid
  # Crust. As you add validations to Crust, be sure to
  # adjust the attributes here as well.
  
  let(:valid_attributes)  { {name: "thin"} }
  let(:invalid_attributes) { {name: nil} }
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CrustsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      crust = Crust.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      crust = Crust.create! valid_attributes
      get :show, params: {id: crust.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Crust" do
        expect {
          post :create, params: {crust: valid_attributes}, session: valid_session
        }.to change(Crust, :count).by(1)
      end

      it "renders a JSON response with the new crust" do

        post :create, params: {crust: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(crust_url(Crust.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new crust" do

        post :create, params: {crust: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: "thick"} }

      it "updates the requested crust" do
        crust = Crust.create! valid_attributes
        past_name = Crust.name
        put :update, params: {id: crust.to_param, crust: new_attributes}, session: valid_session
        crust.reload
        expect(past_name).not_to be(crust.name) 
      end

      it "renders a JSON response with the crust" do
        crust = Crust.create! valid_attributes

        put :update, params: {id: crust.to_param, crust: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the crust" do
        crust = Crust.create! valid_attributes

        put :update, params: {id: crust.to_param, crust: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested crust" do
      crust = Crust.create! valid_attributes
      expect {
        delete :destroy, params: {id: crust.to_param}, session: valid_session
      }.to change(Crust, :count).by(-1)
    end
  end

end
