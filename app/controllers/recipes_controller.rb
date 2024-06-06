class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  # def index
  #   @recipes = Recipe.all
  #   if params[:query].present?
  #     @recipes = @recipes.where(title: params[:query])
  #   end
  # end

  def index
    @recipes = Recipe.all
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR instruction ILIKE :query"
      @recipes = @recipes.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :meal, :photo)
  end
end
