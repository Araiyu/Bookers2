class BooksController < ApplicationController
before_action :authenticate_user!
def index
	@books =Book.all
	@book =Book.new
end

def show
	@book = Book.find(params[:id])
end

def edit
	@book =Book.find(params[:id])
end

def new
	@book =Book.new
end

def create
	book = Book.new(book_params)
	book.user_id = current_user.id
	book.save
	# book.errors.full_messages
	redirect_to book_path(book.id)
end

def update
	book = Book.find(params[:id])
    book.update(book_params)
        redirect_to book_path(book)
end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
end

private
def book_params
	params.require(:book).permit(:title, :body, :user_id)
end

end