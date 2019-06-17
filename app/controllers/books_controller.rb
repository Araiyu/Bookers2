class BooksController < ApplicationController

def index
	@book =Book.new
end

def show
end

def edit
end

def new
	@book =Book.new
end

def create
	book = Book.new(book_params)
	book.sava
	redirect_to bookes_path
end


private
def book_params
	params.require(:book).permit(:title, :body)
end
end
