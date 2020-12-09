class RecipeService
  MIN = 0
  TARGET = 10
  NUTRIENTS = %i[vitamin_c vitamin_d3 iron].freeze

  def initialize(user:)
    @user = user

    @food_intakes    = FoodIntake.todays(@user)
    @activity_levels = ActivityLevel.todays(@user)
    @todays_recipe   = Recipe.todays(@user)&.last
  end

  def run
    if @todays_recipe
      same_as_todays? ? @todays_recipe : (@todays_recipe.update(recipe_params) and return @todays_recipe)
    else
      @user.recipes.create(recipe_params)
    end
  end

  private

  def same_as_todays?
    @todays_recipe.slice(NUTRIENTS).symbolize_keys == recipe_params
  end

  def recipe_params
    @recipe_params ||= NUTRIENTS.index_with do |nutrient|
      calculate_dosage(nutrient)
    end
  end

  def calculate_dosage(nutrient)
    result = TARGET - current_level(nutrient)

    result.in?(MIN..TARGET) ? result : MIN
  end

  def current_level(nutrient)
    @food_intakes.pluck(nutrient).compact.sum - @activity_levels.pluck(nutrient).compact.sum
  end
end
