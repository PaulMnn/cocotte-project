class RecipesController < ApplicationController
  before_action :set_recipe, only: [:destroy]


  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all

    if params[:query].present?
      @recipes = @recipes.search_by_title_and_ingredient_and_instruction(params[:query])
    end

    if params[:meal].present? && params[:meal] != "Type de plat"
      @recipes = @recipes.where(meal: params[:meal])
    end
  end

  def new
    if params[:recipe] && recipe_params[:link_url]
      @recipe = Recipe.new(link_url: recipe_params[:link_url])
      @recipe.set_content
    elsif params[:recipe]
      @recipe = Recipe.new(recipe_params)
    else
      @recipe = Recipe.new(title: params[:title], ingredient: params[:ingredient], instruction: params[:instruction])
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: "Recette bien créée"
    else
      render :new
    end
  end

  def transcribe_image
    transcribe_url = Cloudinary::Uploader.upload(params[:recipe][:photo].path)
    result = OpenaiService.new(url: transcribe_url["url"]).call
    redirect_to new_recipe_path(recipe: {
      title: result["title"],
      ingredient: result["ingredients"],
      instruction: result["preparation_steps"]
    })
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @selected_meal = @recipe.meal
  end

  def update
    @recipe = Recipe.find(params[:id])

    if params[:recipe][:photo].present?
      upload_result = Cloudinary::Uploader.upload(params[:recipe][:photo].path)
      @recipe.picture_url = upload_result['secure_url']
    end

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recette bien mise à jour"
    else
      render :edit
    end
  end


  def destroy
    @recipe.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredient, :instruction, :meal, :photo, :link_url)
  end
end
