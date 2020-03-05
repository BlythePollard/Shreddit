TO DO
- dynamic route for locations
        --- Now working, but dynamic URL is not! how to use parameterized location for URL?
- incorrect login information leading to error page- nomethoderror for          nilclass        
- enforce if_logged_in before_actions for necessary controller actions
    ----before_actions working, flash notice not working when rerouting to home page
- clean up user journey- what makes sense, what looks good, what doesn't?

DONE
- figure out how to do a top ten list
        ---- just did scope and list for 10 most recent



New Notes:

Dynamic route matching:
Route with parameter input - link “view activities by location” + drop-down option select + “go”
-----> how to do this in user show page? Need @activity for form_for, but can't get. 
- could make user home page the users/activities view page- might make easier to do this capability



Specs:

 X Using Ruby on Rails for the project

 X Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

 X Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

 X Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

 X Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

 X- LIKES 
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

 X Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

 X Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

 X Include signup (how e.g. Devise)
 X Include login (how e.g. Devise)
 X Include logout (how e.g. Devise)
 Include third party signup/login (how e.g. Devise/OmniAuth)
 X Include nested resource show or index (URL e.g. users/2/recipes)

 X Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
            ---do i have this for sure? THIS ONE IS HARD

Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate