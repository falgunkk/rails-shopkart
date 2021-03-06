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
        @cart = @user.carts.create(:price => @item.price, :name => @item.name, :description => @item.description,:image => @item.image, :quantity => 1,:itemid => @item.id,:cartdate => Time.now,:fa => 21)
        if @cart.save
          scheduler = Rufus::Scheduler.new
          scheduler.in '20s' do
          @item.update_attribute(:count, @item.count - 1)
          @cart.update_attribute(:quantity, @cart.quantity - 1)
          end
          redirect_to carts_path, :notice => "item addedd to cart."
        else
          redirect_to carts_path, :notice => "item not addedd to cart."
        end
      else
        quantity = current_user.carts.find_by_name(@item.name).quantity
        if current_user.carts.find_by_name(@item.name).update_attribute(:quantity, quantity + 1)
          # scheduler = Rufus::Scheduler.new
          # scheduler.in '20s' do
          # @item.update_attribute(:count, @item.count - 1)
          # current_user.carts.find_by_name(@item.name).update_attribute(:quantity, quantity - 1)
          # end
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
    if @cart.updated_at + 20 >= Time.now.utc
    @item.update_attribute(:count, @item.count - @cart.quantity )
    else
      @item.update_attribute(:count, @item.count- @cart.quantity )
    end
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
  # if @cart.fa == 21
  #     if @cart.cartdate + 20 <= Time.now.utc
  #       @item.update_attribute(:count, @item.count - 1)
  #       @cart.update_attribute(:fa, 25)
  #     end
      if @item.count >= @item.stock
         redirect_to carts_path, :notice => "Your item expired. Can,t buy "
      else
        redirect_to address_path, :notice => "Buy Now "
      end
  #   else
  #     if @item.count >= @item.stock
  #       redirect_to carts_path, :notice => "Your item expired. Can,t buy "
  #     else
  #       redirect_to address_path, :notice => "Buy Now "
  #     end
  #   end
  end

  def address

  end

end
