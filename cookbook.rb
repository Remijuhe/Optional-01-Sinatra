require 'csv'
class Cookbook
  attr_accessor :recipe
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3])
      @recipes << recipe
    end
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index.to_i)
    save_csv
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << recipe.to_array
      end
    end
  end
end

