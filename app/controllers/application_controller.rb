class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do

  end

  post '/recipes' do
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    # binding.pry
    erb :show
  end

  get '/recipes/:id/edit' do
  end

  patch '/recipes/:id' do
  end

  put '/recipes/:id' do
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
