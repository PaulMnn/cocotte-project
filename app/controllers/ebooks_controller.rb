class EbooksController < ApplicationController
  require_dependency 'rmagick_service'

  def show
    @ebook = Ebook.find(params[:id])
    @recipage = Recipage.new
    @recipages = @ebook.recipages
    render layout: 'application2'
  end

  def index
    @recipes_count = Recipe.count
    @ebooks_count = Ebook.count
    @printed_books_count = Ebook.count
    @ebooks = Ebook.all
  end

  def new
    # @recipes = Recipe.all
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new(ebook_params)
    @ebook.associate_theme
    @ebook.user = current_user
    if @ebook.save
      redirect_to ebook_path(@ebook)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def display_choice
    @templates = Ebook.select(:theme).distinct
  end

  def edit
    @ebook = Ebook.find(params[:id])
  end

  def update
    @ebook = Ebook.find(params[:id])
    if @ebook.update(ebook_params)
      redirect_to ebook_path(@ebook)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def ebook_params
    params.require(:ebook).permit(:ebook_title, :theme, recipe_ids: [])
  end
end
