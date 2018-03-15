require 'rails_helper'

RSpec.describe "Cheeses", type: :request do

	
	let(:valid_attributes)  { {name: Faker::Food} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for cheeses
	describe "GET /cheeses" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		cheese = Cheese.create! valid_attributes
		    	end
		    	get "/cheeses"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all cheeses" do
		    	(0..9).each do
		    		cheese = Cheese.create! valid_attributes
		    	end
		    	get "/cheeses"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for cheeses
	describe 'GET /cheeses/:id' do

	    context 'when the record exists' do
	      it 'returns the cheese' do
	      	cheese = Cheese.create! valid_attributes
	      	get "/cheeses/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(cheese.id)
	      end

	      it 'returns status code 200' do
	      	cheese = Cheese.create! valid_attributes
	      	get "/cheeses/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/cheeses/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/cheeses/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /cheeses' do

	    context 'when the request is valid' do
	        before { post '/cheeses', params: {cheese: valid_attributes} }

	     	it 'creates a cheese' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/cheeses', params: {cheese: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /cheeses/:id
  	describe 'DELETE /cheeses/:id' do 
    	it 'returns status code 204' do
    		cheese = Cheese.create! valid_attributes
    		delete "/cheeses/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
