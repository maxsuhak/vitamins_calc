class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def create
    @recipe = RecipeService.new(user: current_user).run
  ensure
    redirect_to recipes_path, flash: { success: 'recipe was generated' }
  end

  def show
    @recipe = current_user.recipes.find(params.require(:id))

    respond_to do |format|
      format.html do
        @data = Recipe::ShowSerializer.new(@recipe).to_h.with_indifferent_access
      end
      format.json do
        render json: @recipe, serializer: Recipe::ShowSerializer
      end
    end
  end
end
