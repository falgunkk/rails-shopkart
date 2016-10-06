# carts controler for adding carts
class CartsController < ApplicationController
  before_action :authenticate_user!
  before_filter :customer_only
  def index 
  	#byebug
  	#@user = User.find(current_user.id)
  	@carts = current_user.carts.all
  end 

  def show
  	@cart = current_user.carts.find(params[:id])
  end

  def create
  	
  	 @user = User.find(current_user.id)
  	 @subcategory = Subcategory.find(params[:subcategory_id])
     @item = @subcategory.items.find(params[:id])
     #@cart = @user.carts.create(@item.attributes.slice(:price, :name, :descriptioin)) 
     @cart = @user.carts.create(:price => @item.price, :name => @item.name, :description => @item.description,:image => @item.image)
     if @cart.save
       redirect_to carts_path, :notice => "item addedd to cart."
     else
       redirect_to carts_path, :notice => "item not addedd to cart."
     end
  end

  def destroy
  	@cart = current_user.carts.find(params[:id])
  	@cart.destroy
  	redirect_to carts_path, :notice => "item deleted from your cart"
  end

  def customer_only
    unless current_user.customer?
      redirect_to root_path, :notice => "Access denied."
    end
  end

end

