require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Dish. As you add validations to Dish, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes)  { { pizza_id: 1} }
  let(:invalid_attributes) { {pizza_id: "trying"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DishesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      dish = Dish.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      dish = Dish.create! valid_attributes
      get :show, params: {id: dish.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Dish" do
        expect {
          post :create, params: {dish: valid_attributes}, session: valid_session
        }.to change(Dish, :count).by(1)
      end

      it "renders a JSON response with the new dish" do

        post :create, params: {dish: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(dish_url(Dish.last))
      end
    end
  end


  describe "DELETE #destroy" do
    it "destroys the requested dish" do
      dish = Dish.create! valid_attributes
      expect {
        delete :destroy, params: {id: dish.to_param}, session: valid_session
      }.to change(Dish, :count).by(-1)
    end
  end

end
