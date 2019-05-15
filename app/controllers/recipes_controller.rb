class RecipesController < ApplicationController
    
    get "/recipes" do
        @recipes = Recipe.all
        erb :"/index"
      end



      
end