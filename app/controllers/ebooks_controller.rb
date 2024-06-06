class EbooksController < ApplicationController
  def show
    @ebook = Ebook.find(params[:id])
    @recipages = @ebook.recipages
  end

  def index
    @recipes_count = Recipe.count
    @ebooks_count = Ebook.count
    @printed_books_count = Ebook.count
    @ebooks = Ebook.all
  end

  def new
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new(ebook_params)
    @ebook.user = current_user
    if @ebook.save
      redirect_to ebook_path(@ebook)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:ebook).permit(:ebook_title, :theme)
  end
end
