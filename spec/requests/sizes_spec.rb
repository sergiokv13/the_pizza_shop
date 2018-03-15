require 'rails_helper'

RSpec.describe "Sizes", type: :request do

	
  	let(:valid_attributes)  { {name: "Small", slices: 4} }
	let(:invalid_attributes) { {name: nil} }

	#Verify Index route for sizes
	describe "GET /sizes" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		size = Size.create! valid_attributes
		    	end
		    	get "/sizes"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all sizes" do
		    	(0..9).each do
		    		size = Size.create! valid_attributes
		    	end
		    	get "/sizes"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for sizes
	describe 'GET /sizes/:id' do

	    context 'when the record exists' do
	      it 'returns the size' do
	      	size = Size.create! valid_attributes
	      	get "/sizes/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(size.id)
	      end

	      it 'returns status code 200' do
	      	size = Size.create! valid_attributes
	      	get "/sizes/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/sizes/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/sizes/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /sizes' do

	    context 'when the request is valid' do
	        before { post '/sizes', params: {size: valid_attributes} }

	     	it 'creates a size' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end


    	context 'when the request is invalid' do
	      
	      	before { post '/sizes', params: {size: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"],\"slices\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /sizes/:id
  	describe 'DELETE /sizes/:id' do 
    	it 'returns status code 204' do
    		size = Size.create! valid_attributes
    		delete "/sizes/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
