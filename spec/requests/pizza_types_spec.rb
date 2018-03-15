require 'rails_helper'

RSpec.describe "PizzaTypes", type: :request do

	
	let(:valid_attributes)  { {name: "Hawaiana"} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for pizza_types
	describe "GET /pizza_types" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		pizza_type = PizzaType.create! valid_attributes
		    	end
		    	get "/pizza_types"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all pizza_types" do
		    	(0..9).each do
		    		pizza_type = PizzaType.create! valid_attributes
		    	end
		    	get "/pizza_types"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for pizza_types
	describe 'GET /pizza_types/:id' do

	    context 'when the record exists' do
	      it 'returns the pizza_type' do
	      	pizza_type = PizzaType.create! valid_attributes
	      	get "/pizza_types/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(pizza_type.id)
	      end

	      it 'returns status code 200' do
	      	pizza_type = PizzaType.create! valid_attributes
	      	get "/pizza_types/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/pizza_types/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/pizza_types/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /pizza_types' do

	    context 'when the request is valid' do
	        before { post '/pizza_types', params: {pizza_type: valid_attributes} }

	     	it 'creates a pizza_type' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/pizza_types', params: {pizza_type: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /pizza_types/:id
  	describe 'DELETE /pizza_types/:id' do 
    	it 'returns status code 204' do
    		pizza_type = PizzaType.create! valid_attributes
    		delete "/pizza_types/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
