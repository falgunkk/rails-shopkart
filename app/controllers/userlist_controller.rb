class UserlistController < ApplicationController
	def index
		@users=User.all
	end

  def new
        @user = User.new
    end

  def show
      #@user = User.find_by_id(params[:id])
      @user = User.find(params[:id])
  end

  def edit
        @user = User.find(params[:id])
    end

  def create
    @user=User.new(secure_params)
    if @user.save
      redirect_to userlist_index_path, :notice => "User created."
      else
      redirect_to userlist_index_path, :notice => "User not created."
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(secure_params)
      redirect_to userlist_index_path, :notice => "User updated."
    else
      redirect_to userlist_index_path, :alert => "Unable to update user."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to userlist_index_path, :notice => "User deleted."
  end

  private

  #def admin_only
    #unless current_user.admin?
      #redirect_to :back, :alert => "Access denied."
    #end
  #end

  def secure_params
    params.require(:user).permit(:email, :password, :password_confirmation,:role)
  end
end