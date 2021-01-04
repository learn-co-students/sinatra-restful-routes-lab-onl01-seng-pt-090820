class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #New
  get '/recipes/new' do
    erb :"/new"
  end

  #Create
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :"/index"
  end

  #Show
  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :"/show"
  end

  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :"/edit"
  end

  #update
  patch '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    # if @recipe.name != ""
      @recipe.update(params[:recipe])
      redirect '/recipes/#{@recipe.id}'
    # else
    #   erb :"/edit"
    # end
  end

  #Delete
  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :"show"
    if @recipe
      @recipe.destroy
    redirect "/recipes"
    end
  end

end
