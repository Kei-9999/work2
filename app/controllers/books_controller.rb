class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def show
    @book = Book.find(params[:id])

  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @books = Book.all
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else

      render action: :index
    end

  end

  def update
    @book = Book.find(params[:id])

     if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
     else

      render action: :edit
     end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
