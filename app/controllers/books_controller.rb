class BooksController < ApplicationController
before_action :authenticate_user!
before_action :check, only:[:update, :edit]
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
if	book.save
	flash[:notice] = "successfully"
	redirect_to book_path(book.id)
else
	flash[:alart] = "error"
	# book.errors.full_messages
	redirect_to books_path
end
end

def update
	book = Book.find(params[:id])
	if  book.update(book_params)
    	flash[:notice] = "successfully"
        redirect_to book_path(book)
	else
		flash[:alart] = "error"
		@book = Book.find(params[:id])
		render :edit
end
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
def check
	book = Book.find(params[:id])
	if current_user != book.user
		redirect_to books_path
	end
end

end