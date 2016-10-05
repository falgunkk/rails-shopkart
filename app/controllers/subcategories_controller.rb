# this controller defines all actions upon subcategories
class SubcategoriesController < ApplicationController
  
  before_action :authenticate_user!
  before_filter :owner_only, :except => [:index, :search, :searchresults]
  def index
    @category = Category.find(params[:category_id])
    @subcategories = @category.subcategories.all
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.new
  end

  def search
  end

  def searchresults
    @category = Category.find(params[:id])
    @results = @category.subcategories.where("name LIKE '%#{params[:word]}%' ")
  end

  def edit
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.create(sub_params)
    if @subcategory.save
      redirect_to category_subcategories_path, :notice => "subcategory created."
    else
      redirect_to category_subcategories_path, :notice => "subcategory not created."
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
    if @subcategory.update(sub_params)
      redirect_to category_subcategories_path, :notice => "subcategory updated."
    else
      redirect_to category_subcategories_path, :alert => "Unable to update subcategory"
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
    @subcategory.destroy
    redirect_to category_subcategories_path, :notice => "subcategory deleted."
  end

  def owner_only
    unless current_user.owner?
      redirect_to root_path, :notice => "Access denied."
    end
  end

  private

  def sub_params
    params.require(:subcategory).permit(:name)
  end

end

