class CategoriesController < ApplicationController
	def index
		@categories=Category.all
	end

  def new
        @category = Category.new 
    end

  def show
      #@user = User.find_by_id(params[:id])
      @category = Category.find(params[:id])
  end

  def edit
        @category= Category.find(params[:id])
    end

  def create
    @category=Category.new(secure_params)
    if @category.save
      redirect_to categories_path, :notice => "category created."
      else
      redirect_to categories_path, :notice => "category not created."
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(secure_params)
      redirect_to categories_path, :notice => "category updated."
    else
      redirect_to categories_path, :alert => "Unable to update category"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, :notice => "category deleted."
  end

  private

  #def admin_only
    #unless current_user.admin?
      #redirect_to :back, :alert => "Access denied."
    #end
  #end

  def secure_params
    params.require(:category).permit(:name)
  end

end

