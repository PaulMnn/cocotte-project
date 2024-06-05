class EbooksController < ApplicationController
  def show
    @ebook = Ebook.find(params[:id])
  end

  def index
    @ebooks = Ebook.all
  end

  def new
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new(ebook_params)
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
    params.require(:ebook).permit(:title, :description)
  end
end
