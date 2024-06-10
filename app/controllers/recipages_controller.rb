class RecipagesController < ApplicationController
  def delete
    @recipage = Recipage.find(params[:id])
    @recipage.destroy
    redirect_to ebook_path, status: :see_other
  end

  def create
    @recipage = Recipage.new(recipage_params)
    if @recipage.save
      redirect_to @recipage, notice: "Recette bien ajoutée"
    else
      render :new
    end
  end

  private

  def recipage_params
    params.require(:recipage).permit(:templating, :recipe, :recipe_id)
  end
end
