class BooksController < ApplicationController

  def index
    @books = Book.order(:position)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @count = Book.count
    @book = Book.new(position: @count + 1)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book successfully created"
    else
      # The 'new' action is NOT being called here
      # Assign any instance variables needed
      # @count = Book.count
      # unused
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: "Book successfully updated"
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book successfully deleted"
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :position,
    )
  end

end
