class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # New Actions
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "recipes/#{recipe.id}"
  end

  #Show action

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #Edit Action
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    @recipe.update(cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  #Delete Action
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect "/recipes"
  end

end
