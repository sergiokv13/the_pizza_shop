require 'rails_helper'

RSpec.describe "Crusts", type: :request do

	
	let(:valid_attributes)  { {name: "Thin"} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for crusts
	describe "GET /crusts" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		crust = Crust.create! valid_attributes
		    	end
		    	get "/crusts"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all crusts" do
		    	(0..9).each do
		    		crust = Crust.create! valid_attributes
		    	end
		    	get "/crusts"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for crusts
	describe 'GET /crusts/:id' do

	    context 'when the record exists' do
	      it 'returns the crust' do
	      	crust = Crust.create! valid_attributes
	      	get "/crusts/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(crust.id)
	      end

	      it 'returns status code 200' do
	      	crust = Crust.create! valid_attributes
	      	get "/crusts/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/crusts/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/crusts/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /crusts' do

	    context 'when the request is valid' do
	        before { post '/crusts', params: {crust: valid_attributes} }

	     	it 'creates a crust' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/crusts', params: {crust: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /crusts/:id
  	describe 'DELETE /crusts/:id' do 
    	it 'returns status code 204' do
    		crust = Crust.create! valid_attributes
    		delete "/crusts/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
