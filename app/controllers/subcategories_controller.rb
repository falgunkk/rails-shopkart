class SubcategoriesController < ApplicationController
	
	  def index
	 	@category=Category.find(params[:category_id])
		@subcategories=@category.subcategories.all
	  end

  def new
        @category=Category.find(params[:category_id])
        @subcategory = @category.subcategories.new 
    end

  #def show
    # @category=Category.find(params[:category_id])
    # @subcategory=@category.subcategories.find(params[:id])

  #     @subcategory = Subcategory.find(params[:id])
   #end

  def edit
  #       @subcategory= Subcategory.find(params[:id])
        @category=Category.find(params[:category_id])
        @subcategory = @category.subcategories.find(params[:id])
   end

  def create
    #@subcategory=Subcategory.new(secure_params)
    @category=Category.find(params[:category_id])
    @subcategory=@category.subcategories.create(sub_params)
    redirect_to category_subcategories_path
    # if @subcategory.save
    #   redirect_to category_subcategories_path, :notice => "subcategory created."
    #   else
    #   redirect_to category_subcategories_path, :notice => "subcategory not created."
    # end

  end

  def update
        @category=Category.find(params[:category_id])
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

  private

  #def admin_only
    #unless current_user.admin?
      #redirect_to :back, :alert => "Access denied."
    #end
  #end

  def sub_params
    params.require(:subcategory).permit(:name)
  end

end


  

