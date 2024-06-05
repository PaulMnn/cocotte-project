class EbooksController < ApplicationController
  def new
    @ebook = Ebook.new
  end

  def create
    @rebook = Ebook.new(ebook_params)
    @ebook.user = current_user
    if @ebook.save
      redirect_to ebook_path(@ebook)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ebook_params
    params.require(:ebook).permit(:ebook_title, :theme)
  end
end
