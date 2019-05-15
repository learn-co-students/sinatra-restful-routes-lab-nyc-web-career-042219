require 'pry'
class RecipesController < ApplicationController

  #get index page of all recipes
    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

#gets a new form
  get '/recipes/new' do
    erb :new
  end

  #get edit form
    get '/recipes/:id/edit' do
      @recipe = Recipe.find_by_id(params[:id])
      erb :edit
    end

  #saves new recipe
    post '/recipes' do
      @recipe = Recipe.create(params)
      redirect to "/recipes/#{@recipe.id}"
    end

#patch to actually do the edit
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end



#delete recipe
  delete '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  #display specific recipe
    get '/recipes/:id' do
      @recipe = Recipe.find_by_id(params[:id])
      erb :show
    end

end
