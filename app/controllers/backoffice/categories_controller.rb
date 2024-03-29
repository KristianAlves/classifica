class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only:[:edit, :update]


  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category =CategoryService.create(params_category)
      unless @category.errors.any?
        redirect_to backoffice_categories_path, notice: t('messages.category.success_register')
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: t('messages.category.success_update')
    else
      render :edit
    end
  end

  private
      def params_category
        params.require(:category).permit(:description)
      end

    def set_category
        @category = Category.friendly.find(params[:id])
    end
end
