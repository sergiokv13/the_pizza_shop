require 'rails_helper'

RSpec.describe "Sauces", type: :request do

	
	let(:valid_attributes)  { {name: Faker::Food} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for sauces
	describe "GET /sauces" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		sauce = Sauce.create! valid_attributes
		    	end
		    	get "/sauces"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all sauces" do
		    	(0..9).each do
		    		sauce = Sauce.create! valid_attributes
		    	end
		    	get "/sauces"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for sauces
	describe 'GET /sauces/:id' do

	    context 'when the record exists' do
	      it 'returns the sauce' do
	      	sauce = Sauce.create! valid_attributes
	      	get "/sauces/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(sauce.id)
	      end

	      it 'returns status code 200' do
	      	sauce = Sauce.create! valid_attributes
	      	get "/sauces/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/sauces/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/sauces/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /sauces' do

	    context 'when the request is valid' do
	        before { post '/sauces', params: {sauce: valid_attributes} }

	     	it 'creates a sauce' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/sauces', params: {sauce: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /sauces/:id
  	describe 'DELETE /sauces/:id' do 
    	it 'returns status code 204' do
    		sauce = Sauce.create! valid_attributes
    		delete "/sauces/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
