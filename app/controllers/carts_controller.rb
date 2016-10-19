# carts controler for adding carts
class CartsController < ApplicationController
  before_action :authenticate_user!
  before_filter :customer_only
  def index
    @carts = current_user.carts.all
  end

  def show
    @cart = current_user.carts.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @subcategory = Subcategory.find(params[:subcategory_id])
    @item = @subcategory.items.find(params[:id])
    if (@item.stock - @item.count) > 0
      @item.update_attribute(:count, @item.count + 1)
      unless current_user.carts.exists?(name:  @item.name)
       @cart = @user.carts.create(:price => @item.price, :name => @item.name, :description => @item.description,:image => @item.image, :quantity => 1,:itemid => @item.id,:cartdate => Time.now)
       if @cart.save
       redirect_to carts_path, :notice => "item addedd to cart."
       else
       redirect_to carts_path, :notice => "item not addedd to cart."
       end
      else
        quantity = current_user.carts.find_by_name(@item.name).quantity
      if current_user.carts.find_by_name(@item.name).update_attribute(:quantity, quantity + 1)
        redirect_to carts_path, :notice => "cart quantity added ."
      else
        redirect_to carts_path, :notice => "cart quantity not updated."
      end
      end
    else
      redirect_to carts_path, :notice => " No stock" 
    end
  end

  def destroy
    @cart = current_user.carts.find(params[:id])
    @item =Item.find_by_id(@cart.itemid)
    @item.update_attribute(:count, @item.count - @cart.quantity)
    @cart.destroy
    redirect_to carts_path, :notice => "item deleted from your cart"
  end

  def customer_only
    unless current_user.customer?
      redirect_to root_path, :notice => "Access denied."
    end
  end

  def buy
    @cart = current_user.carts.find(params[:id])
    @item = Item.find_by_id(@cart.itemid)
    if @cart.cartdate + 20 <= Time.now.utc
      @item.update_attribute(:count, @item.count - @cart.quantity)
      @cart.destroy
      redirect_to carts_path, :notice => "Your item expired. Can,t buy "
    end
  end

end
