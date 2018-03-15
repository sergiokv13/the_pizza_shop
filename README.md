# The Pizza Shop

This project handles the administration and orders of the pizza shop as a REST service written in Ruby on Rails.

## Architecture

The following patters are used in the project

* **MVC** - *Model View Controller* - This pattern divides the business logic, the representation and the management of events and the comunications, using three components, model, view and controller. 

We can see the application of the pattern in the next diagram: https://goo.gl/bhihMw

* **REST** - *Representational State Transfer* - Rest web services provides the ability to access representations of web resources using http requests. You can request data, or execute operations over some data. 

The project uses JSON for the communication.

Aditional the next diagrams represent part of the design.

Use cases: https://goo.gl/Lt2yZW

Class diagram: https://goo.gl/3STZ8T

## Testing

The following gems are used for the testing process

```
  gem 'rspec-rails', '~> 3.5' 
  gem 'faker'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
```

To test please run the following command


```
  bundle exec rspec
```

## Seeding

The main data described in the exercise is generated in the seeds file. Please run the following commmand

```
  rake db:seed
```

##Administration

The following requests are for the pizza manager to administrate the pizza shop.

###Cheeses

If it gets necessary to administrate the cheeses you can:

**Create**

```
  URL:        		/cheeses
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"cheese":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"cheese":{"name":"Pomodoro"}}'  http://localhost:3000/cheeses

```

```
 RESPONSE:	    	{
 						"id":4,
 						"name":"Pomodoro",
 						"created_at":"2018-03-15T16:59:59.217Z",
 						"updated_at":"2018-03-15T16:59:59.217Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/cheeses/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/cheeses/4
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/cheeses/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"cheese":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"cheese":{"name":"Provolone"}}'  http://localhost:3000/cheeses/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```

###Crusts

If it gets necessary to administrate the crusts you can:

**Create**

```
  URL:        		/crusts
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"crusts":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"crust":{"name":"Thin"}}'  http://localhost:3000/crusts

```

```
 RESPONSE:	    	{
 						"id":1,"name":"Thin",
 						"created_at":"2018-03-15T17:18:53.173Z",
 						"updated_at":"2018-03-15T17:18:53.173Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/crusts/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/crusts/1
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/crusts/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"crust":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"crust":{"name":"Thick"}}'  http://localhost:3000/crusts/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```


###Sauce

If it gets necessary to administrate the sauces you can:

**Create**

```
  URL:        		/sauces
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"sauces":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"sauce":{"name":"BBQ"}}'  http://localhost:3000/sauces

```

```
 RESPONSE:	    	{
 						"id":1,"name":"BBQ",
 						"created_at":"2018-03-15T17:18:53.173Z",
 						"updated_at":"2018-03-15T17:18:53.173Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/sauces/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/sauces/1
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/sauces/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"sauce":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"sauce":{"name":"Honey Mustard"}}'  http://localhost:3000/sauces/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```

###Pizza Types

If it gets necessary to administrate the pizza types you can:

**Create**

```
  URL:        		/pizza_types
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"pizza_types":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"pizza_type":{"name":"HAWAIANA"}}'  http://localhost:3000/pizza_types

```

```
 RESPONSE:	    	{
 						"id":1,"name":"HAWAIANA",
 						"created_at":"2018-03-15T17:18:53.173Z",
 						"updated_at":"2018-03-15T17:18:53.173Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/pizza_types/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/pizza_types/1
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/pizza_types/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"pizza_type":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"pizza_type":{"name":"VEGGAN"}}'  http://localhost:3000/pizza_types/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```

###Non Pizzas

If it gets necessary to administrate the pizza types you can:

**Create**

```
  URL:        		/non_pizzas
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"non_pizzas":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"non_pizza":{"name":"Spaghetti"}}'  http://localhost:3000/non_pizzas

```

```
 RESPONSE:	    	{
 						"id":1,"name":"Spaghetti",
 						"created_at":"2018-03-15T17:18:53.173Z",
 						"updated_at":"2018-03-15T17:18:53.173Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/non_pizzas/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/non_pizzas/1
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/non_pizzas/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"non_pizza":
						{
							"name":[STRING]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"non_pizza":{"name":"Lasagna"}}'  http://localhost:3000/non_pizzas/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```

###Size

If it gets necessary to administrate the sizes of the pizza you can:

**Create**

```
  URL:        		/sizes
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"sizes":
						{
							"name":[STRING],
							"slices":[INTEGER]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"size":{"name":"Big","slices":10}}'  http://localhost:3000/sizes

```

```
 RESPONSE:	    	{
 						"id":1,"name":"Big",
 						"slices":10,
 						"created_at":"2018-03-15T17:30:17.887Z",
 						"updated_at":"2018-03-15T17:30:17.887Z"
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```

**Delete**

```
 URL:        		/sizes/:id
```

```
 MEHTOD:     		DELETE
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL:	     		curl -X "DELETE" http://localhost:3000/sizes/1
```

```
 STATUS:	    	204: Deleted
 					400: Bad request
 					404: Not found

```

**Put**

```
 URL:        		/sizes/:id
```

```
 MEHTOD:     		PUT
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 DATA PARAMS:     	
	 				{
	 					"size":
						{
							"name":[STRING]
							"slices":[INTEGER]
						}
	 				}
```

```
 CURL:	     		curl -v -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d ' {"size":{"name":"SMALL", "slices":4}}'  http://localhost:3000/sizes/1

```

```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found

```