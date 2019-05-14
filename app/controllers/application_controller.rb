class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
  @recipes = Recipe.all
  	erb :index
  end

  get "/recipes/new" do
  	erb :new
  end

  post "/recipes" do 
  	@recipe = Recipe.create(params)
  	redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id/edit" do
  	# binding.pry
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end
  # code actions here!

  patch "/recipes/:id" do
  	# binding.pry
  	@recipe = Recipe.find(params[:id])
  	@recipe.update(name: params[:name])
  	@recipe.update(ingredients: params[:ingredients])
  	@recipe.update(cook_time: params[:cook_time])
  	redirect to"/recipes/#{@recipe.id}"
  end


delete "/recipes/:id" do 
  @recipe = Recipe.delete(params[:id])
  redirect to ("/recipes")

end 


  get "/recipes/:id" do
  	# binding.pry
  	@recipe = Recipe.find(params[:id])
  	erb :show
  end


end
