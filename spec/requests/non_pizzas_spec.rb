require 'rails_helper'

RSpec.describe "NonPizzas", type: :request do

	
	let(:valid_attributes)  { {name: "Salad"} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for non_pizzas
	describe "GET /non_pizzas" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		non_pizza = NonPizza.create! valid_attributes
		    	end
		    	get "/non_pizzas"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all non_pizzas" do
		    	(0..9).each do
		    		non_pizza = NonPizza.create! valid_attributes
		    	end
		    	get "/non_pizzas"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for non_pizzas
	describe 'GET /non_pizzas/:id' do

	    context 'when the record exists' do
	      it 'returns the non_pizza' do
	      	non_pizza = NonPizza.create! valid_attributes
	      	get "/non_pizzas/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(non_pizza.id)
	      end

	      it 'returns status code 200' do
	      	non_pizza = NonPizza.create! valid_attributes
	      	get "/non_pizzas/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/non_pizzas/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/non_pizzas/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /non_pizzas' do

	    context 'when the request is valid' do
	        before { post '/non_pizzas', params: {non_pizza: valid_attributes} }

	     	it 'creates a non_pizza' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/non_pizzas', params: {non_pizza: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /non_pizzas/:id
  	describe 'DELETE /non_pizzas/:id' do 
    	it 'returns status code 204' do
    		non_pizza = NonPizza.create! valid_attributes
    		delete "/non_pizzas/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
