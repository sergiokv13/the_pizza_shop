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

## Administration

The following requests are for the pizza manager to administrate the pizza shop.


### Non Pizzas

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



### Pizza Types

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


### Cheeses

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

### Crusts

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


### Sauce

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


### Size

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


### Orders

View all orders

**View all orders**


```
  URL:        		/dishes
```

```
  MEHTOD:     		GET
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/dishes

```


```
 STATUS:	    	200: Succeed
 					400: Bad request
```


With the id of the dish order you can change the state

**Change state of order**


```
  URL:        		/dishes/next_state/:id/:delivery
```

```
  MEHTOD:     		GET
```

```
 URL PARAMS:     	"id":[INTEGER]
 					":delivery":[BOOLEAN]
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/dishes/next_state/1/true

```


```
 STATUS:	    	200: Succeed
 					400: Bad request
 					404: Not found
```

## Client


The following requests are for the pizza shop client 

### Cheeses


**View Non pizza dishes**

```
  URL:        		/non_pizzas
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/non_pizzas

```


```
 STATUS:	    	201: Created
 					400: Bad request
```

### Pizzazs


**View types of pizza**

```
  URL:        		/pizza_types
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/pizza_types

```


```
 STATUS:	    	201: Created
 					400: Bad request
```





### Cheeses


**View Cheeses**

```
  URL:        		/cheeses
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/cheeses

```


```
 STATUS:	    	201: Created
 					400: Bad request
```

### Sizes


**View Sizes**

```
  URL:        		/sizes
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/sizes

```


```
 STATUS:	    	201: Created
 					400: Bad request
```

### Crusts


**View Crusts**

```
  URL:        		/crusts
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/crusts

```


```
 STATUS:	    	201: Created
 					400: Bad request
```


### Sauces

**View Sauces**

```
  URL:        		/sauces
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/sauces

```


```
 STATUS:	    	201: Created
 					400: Bad request
```



### Ingredients


**View Ingredients**

```
  URL:        		/ingredients
```

```
  MEHTOD:     		GET
```


```
 CURL EXAMPLE:	    curl http://localhost:3000/ingredients

```


```
 STATUS:	    	201: Created
 					400: Bad request
```



### NON PIZZA Order

After viewing the menu /non_pizzas you can order as follows.

**Order non pizza**


```
  URL:        		/dishes
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"dishes":
						{
							"non_pizza_id":[INTEGER]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"dish":{"non_pizza_id":1}}'  http://localhost:3000/dishes

```

```
 RESPONSE:	    	{
 						"id":1,"state":"In preparation",
 						"created_at":"2018-03-15T17:50:14.295Z",
 						"updated_at":"2018-03-15T17:50:14.295Z",
 						"pizza_id":null,
 						"non_pizza_id":1
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```


With the id of your dish order you can review the state

**Review state of non pizza**


```
  URL:        		/dishes/:id
```

```
  MEHTOD:     		GET
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/dishes/1

```


```
 STATUS:	    	201: Created
 					400: Bad request
```


### PIZZA Order

After viewing the /pizza_types, /cheeses, /sizes, /sauces, /crusts, /ingredients menus you can order a pizza as follows:

**Order pizza - Step 1**

Build your pizza 

```
  URL:        		/pizzas
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"pizzas":
						{
							"pizza_type_id":[INTEGER],
							"cheese_id":[INTEGER],
							"size_id":[INTEGER],
							"sauce_id":[INTEGER],
							"crust_id":[INTEGER],
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"pizza": {"pizza_type_id": 1 , "cheese_id": 1 , "size_id": 1 , "sauce_id": 1 , "crust_id" : 1}}'  http://localhost:3000/pizzas

```

```
 RESPONSE:	    	{
 						"id":1,
 						"created_at":"2018-03-15T18:11:56.372Z",
 						"updated_at":"2018-03-15T18:11:56.372Z",
 						"cheese_id":1,
 						"sauce_id":1,
 						"crust_id":1,
 						"size_id":1,
 						"pizza_type_id":1
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```


**Order pizza - Step 2 (Optional)**

Add ingredients to your pizza

```
  URL:        		/pizza/:id/:ingredient_id
```

```
  MEHTOD:     		GET
```

```
 URL PARAMS:     	"id":[INTEGER]
 					"ingredient_id":[INTEGER]
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/pizza/1/1

```

```
 STATUS:	    	201: Created
 					400: Bad request
```



**Order pizza - Step 3**

Order the pizza you made


```
  URL:        		/dishes
```

```
  MEHTOD:     		POST
```

```
 DATA PARAMS:     	
	 				{
	 					"dishes":
						{
							"pizza_id":[INTEGER]
						}
	 				}
```

```
 CURL EXAMPLE:	    curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"dish":{"pizza_id":1}}'  http://localhost:3000/dishes

```

```
 RESPONSE:	    	{
 						"id":1,"state":"In preparation",
 						"created_at":"2018-03-15T17:50:14.295Z",
 						"updated_at":"2018-03-15T17:50:14.295Z",
 						"pizza_id":1,
 						"non_pizza_id":null
 					}

```

```
 STATUS:	    	201: Created
 					400: Bad request
 					422: Invalid attributes

```


With the id of your dish order you can review the state

**Review state of pizza**


```
  URL:        		/dishes/:id
```

```
  MEHTOD:     		GET
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/dishes/1

```


```
 STATUS:	    	201: Created
 					400: Bad request
```


**Review ingredients of pizza**


```
  URL:        		/pizza/:id/ingredients
```

```
  MEHTOD:     		GET
```

```
 URL PARAMS:     	"id":[INTEGER]
```

```
 CURL EXAMPLE:	    curl http://localhost:3000/pizza/1/ingredients

```


```
 STATUS:	    	201: Created
 					400: Bad request
```
