class TodolistsController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to todolist_path(@book.id)
    else
      # renderするときはflash.now
      flash.now[:alert] = 'error'
      render :new
    end
  end

  def index
    @books = Book.all
    # binding.pry
    # indexに新規投稿機能をつけるため追記
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to todolist_path(book.id)
    else
      flash.now[:alert] = 'error'
      render :index
    end
    # redirect_to todolist_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to todolists_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
