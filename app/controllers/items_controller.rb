# it defines all actions on items
class ItemsController < ApplicationController
  def index
    @subcategory = Subcategory.find(params[:subcategory_id])
    @items = @subcategory.items.all
  end

  def new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.new
  end

  def show 
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    #@subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
    #@item = Items.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
  end

  def create
    @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.create(item_params)
    if @item.save
      redirect_to  category_subcategory_items_path, :notice => "Item created."
    else
      redirect_to  category_subcategory_items_path, :notice => "Item not created."
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

  private

  def item_params
    params.require(:item).permit(:name,:description, :price, :image)
  end

end

