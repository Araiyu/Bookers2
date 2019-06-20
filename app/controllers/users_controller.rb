class UsersController < ApplicationController

def create
	user = User.new(user_params)
	user.save
	redirect_to book_path

end

def index
	@users =User.all
	@user =current_user
end

def show
	@user = User.find(params[:id])
	@book = Book.new

end

def edit
	 @user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
    	render :edit
    end
end


private
def book_params
	params.require(:book).permit(:title, :body)
end
def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)

end
end