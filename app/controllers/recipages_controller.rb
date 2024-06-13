class RecipagesController < ApplicationController
  require_dependency 'rmagick_service'

  def destroy
    @recipage = Recipage.find(params[:id])
    @ebook = @recipage.ebook
    @recipage.destroy
    redirect_to ebook_path(@ebook), status: :see_other
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipage = Recipage.new(recipage_params)
    @ebook = @recipage.ebook
    @recipage.recipe = @recipe
    if @recipage.save
      # RMagickService.new(@recipage).create_image_with_text
      redirect_to @ebook
    else
      @recipages = @ebook.recipages
      render layout: 'application2'
      render ""
    end
  end

  private

  def recipage_params
    params.require(:recipage).permit(:templating, :recipe, :recipe_id, :ebook_id)
  end
end
