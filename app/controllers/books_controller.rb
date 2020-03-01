class BooksController < ApplicationController

  def top
  end

  def index
  	# 記事を全件取得
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	if  @book.save
  	  flash[:success] = "Book was successfully created"
  	  redirect_to book_path(@book.id) # 詳細画面へリダイレクト
    else
      @books = Book.all
      render "index"
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	flash[:success] = "Book was successfully updated."
  	redirect_to book_path(@book.id)
  end

  def destroy
  	@book = Book.find(params[:id]) #データ（レコード）を１件取得
  	@book.destroy #データ（レコード）を削除
  	flash[:notice] = "Book was successfully destroyed"
  	redirect_to books_path(@books)  #Book一覧画面へリダイレクト
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
