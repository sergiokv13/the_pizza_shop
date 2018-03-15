require 'rails_helper'

RSpec.describe "Pizzas", type: :request do

  let(:valid_attributes)  { {pizza_type: Faker::Food, cheese_id: 1, sauce_id: 1, crust_id: 1, size_id: 1} }
  let(:invalid_attributes) { {pizza_type: nil} }

  #Set the models needed for the relation
  def set_models
    Cheese.create(name:"Muzarela")
    Sauce.create(name: "BBQ")
    Crust.create(name: "Thin")
    Size.create(name: "Small", slices: 4)
  end

	#Verify Index route for pizzas
	describe "GET /pizzas" do

		before(:each) do
       		set_models
    	end

		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		pizza = Pizza.create! valid_attributes
		    	end
		    	get "/pizzas"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all pizzas" do
		    	(0..9).each do
		    		pizza = Pizza.create! valid_attributes
		    	end
		    	get "/pizzas"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for pizzas
	describe 'GET /pizzas/:id' do

		 before(:each) do
	       set_models
	    end

	    context 'when the record exists' do
	      it 'returns the pizza' do
	      	pizza = Pizza.create! valid_attributes
	      	get "/pizzas/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(pizza.id)
	      end

	      it 'returns status code 200' do
	      	pizza = Pizza.create! valid_attributes
	      	get "/pizzas/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/pizzas/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/pizzas/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /pizzas' do

		 before(:each) do
	       set_models
	    end

	    context 'when the request is valid' do
	        before { post '/pizzas', params: {pizza: valid_attributes} }

	    	it 'creates a pizza' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end

    	context 'when the request is invalid' do
	      
	      	before { post '/pizzas', params: {pizza: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"pizza_type\":[\"can't be blank\"],\"cheese\":[\"must exist\"],\"sauce\":[\"must exist\"],\"crust\":[\"must exist\"],\"size\":[\"must exist\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /pizzas/:id
  	describe 'DELETE /pizzas/:id' do 

  		 before(:each) do
	       set_models
	    end

    	it 'returns status code 204' do
    		pizza = Pizza.create! valid_attributes
    		delete "/pizzas/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
