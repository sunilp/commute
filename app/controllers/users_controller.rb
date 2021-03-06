class UsersController < ApplicationController
  
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers, :allusers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy


  def show
  	@user = User.find(params[:id])
    @newUser = User.find_by_id(params[:id])

  	@microposts = @user.microposts.paginate(page: params[:page])
  end	

  def new
  	@user = User.new
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def index
    @users = User.paginate(page: params[:page])
  end

def create
    @user = User.new(params[:user])
    if @user.save
      Notifier.signup_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to Commute!"	
      redirect_to @user
    else
      render 'new'
    end
  end

def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
end


def edit
end

def allusers
  if params[:term]
    like="%" + params[:term] +"%"
    all_users = User.where("lower(name) like lower(?)",like)
  else
    all_users = User.all
   end 
    list = all_users.map {|u| Hash[id:u.id, label:u.name, name:u.name]}
    render json: list
end 

def update
    if @user.update_attributes(params[:user])
	  flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
