require 'rails_helper'

RSpec.describe "Dishes", type: :request do

	
	let(:valid_attributes)  { {name: "PIZZA", pizza_id: 1} }
	let(:invalid_attributes) { {name: nil} }
	#Not Pizza
	let(:valid_attributes_exlusive)  { {name: Faker::Food} }

	#Verify Index route for dishes
	describe "GET /dishes" do
		context 'when there is data' do
		    it "get status 200" do
		    	(0..10).each do
		    		dish = Dish.create! valid_attributes
		    	end
		    	get "/dishes"
		    	expect(response).to have_http_status(200)
		    end

		    it "returns all dishes" do
		    	(0..9).each do
		    		dish = Dish.create! valid_attributes
		    	end
		    	get "/dishes"
		    	json = JSON.parse(response.body)
		    	expect(json.size).to eq(10)
		    end
		end
	end

	#Verify Show route for dishes
	describe 'GET /dishes/:id' do

	    context 'when the record exists' do
	      it 'returns the dish' do
	      	dish = Dish.create! valid_attributes
	      	get "/dishes/1"
	      	json = JSON.parse(response.body)
	        expect(response.body).not_to be_empty
	        expect(json['id']).to eq(dish.id)
	      end

	      it 'returns status code 200' do
	      	dish = Dish.create! valid_attributes
	      	get "/dishes/1"
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	      it 'returns status code 404' do
	      	get "/dishes/1"
	        expect(response).to have_http_status(404)
	      end

	      it 'returns a not found message' do
	      	get "/dishes/1"
	        expect(response.body).to match('{\"error\":\"not-found\"}')
	      end
	    end
 	end

 	#Verify Show route for Post
	describe 'POST /dishes' do

	    context 'when the request is valid and not pizza' do
	        before { post '/dishes', params: {dish: valid_attributes_exlusive} }

	     	it 'creates a dish' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end

    	context 'when the request is pizza' do
	        before { post '/dishes', params: {dish: valid_attributes} }

	     	it 'creates a dish' do
	     		json = JSON.parse(response.body)
	        	expect(json['id']).to eq(1)
	      	end

	      	it 'returns status code 201' do
	        	expect(response).to have_http_status(201)
	      	end
    	end

    	context 'when the request is invalid' do
	      
	      	before { post '/dishes', params: {dish: invalid_attributes} }
	     		it 'returns status code 422' do
	        	expect(response).to have_http_status(422)
	      	end

	      	it 'returns a validation failure message' do
	        	expect(response.body).to match("{\"name\":[\"can't be blank\"]}")
	      	end
    	end

 	end

 	# Test suite for DELETE /dishes/:id
  	describe 'DELETE /dishes/:id' do 
    	it 'returns status code 204' do
    		dish = Dish.create! valid_attributes
    		delete "/dishes/1"
      		expect(response).to have_http_status(204)
    	end
  	end


end
