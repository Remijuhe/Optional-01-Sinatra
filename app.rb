require_relative "cookbook"
require_relative "recipe"
require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  csv_file   = File.join(__dir__, 'recipes.csv')
  cookbook   = Cookbook.new(csv_file)
  @recipes = cookbook.all
  erb :index
end

get '/new.erb' do
  # name = params.fetch("name")
  # description = params.fetch("description")
  # prep_time = params.fetch("prep_time")
  # difficulty = params.difficulty("<difficulty></difficulty>")
  erb :new
end

post recipes do
  name = name
  description = description
  difficulty = difficulty
  prep_time = prep_time
  recipe = Recipe.new(name, description, prep_time, difficulty)
  @recipes.add_recipe(recipe) << recipe

end
