# this controller defines all actions on categories.
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_filter :owner_only, :except => [:index, :search, :searchresults]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def search
  end

  def searchresults
    @results = Category.where("name LIKE '%#{params[:word]}%' ")
  end

  def create
    @category = Category.new(secure_params)
    if @category.save
      redirect_to categories_path, :notice => "category created"
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

  def owner_only
    unless current_user.owner?
      redirect_to root_path, :notice => "Access denied."
    end
  end

  private

  def secure_params
    params.require(:category).permit(:name)
  end

end

