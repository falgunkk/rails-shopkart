# it defines all actions on items
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_filter :vendor_only, :only => [:new, :edit, :create, :update,:destroy,:additem]
  def index
    @subcategory = Subcategory.find(params[:subcategory_id])
    @items = @subcategory.items.all
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    @item = @subcategory.items.new
  end

  def show
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    # @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
    # @item = Items.find(params[:id])
  end

  def search
  end

  def searchresults
    @category = Category.find(params[:cat_id])
    @subcategory = @category.subcategories.find(params[:sub_id])
    @results = @subcategory.items.where("name LIKE '%#{params[:word]}%' ")
  end


  def edit
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
  end

  def create
    @subcategory = Subcategory.find(params[:subcategory_id])
    # @subcategory = Subcategory.find(params[:item][:subcategory_id])
    @item = @subcategory.items.create(item_params)

    if @item.save
      # redirect_to  category_subcategory_items_path(:subcategory_id => params[:subcategory_id]), :notice => "Item created."
      # render text: 'Saved'
      redirect_to  root_path, :notice => "Item created."

    else
      # redirect_to  category_subcategory_items_path, :notice => "Item not created."
      # render text: ' Not Saved'
       redirect_to  root_path, :notice => "Item not created."
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
    if @item.update(item_params)
        redirect_to  category_subcategory_items_path, :notice => "Item created."
    else
      redirect_to  category_subcategory_items_path, :notice => "Item not created."
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
    @item.destroy
    redirect_to category_subcategory_items_path, :notice => "deleted"
  end

  def additem
  end

  def vendor_only
    unless current_user.vendor?
      redirect_to root_path, :notice => "Access denied."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description, :price, :image,:userid,:enddate,:stock,:count)
  end

end

