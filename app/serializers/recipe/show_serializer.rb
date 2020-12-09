class Recipe::ShowSerializer < ActiveModel::Serializer
  attributes %i[
    vitamin_c
    vitamin_d3
    iron
    food_intake_vitamin_c
    food_intake_vitamin_d3
    food_intake_iron
    activity_level_vitamin_c
    activity_level_vitamin_d3
    activity_level_iron
    vitamin_c_diff
    vitamin_d3_diff
    iron_diff
    date
  ]

  def date
    object.created_at.strftime('%d/%m/%Y %H:%M')
  end

  def food_intake_vitamin_c
    food_intakes.pluck('vitamin_c').compact.sum
  end

  def food_intake_vitamin_d3
    food_intakes.pluck('vitamin_d3').compact.sum
  end

  def food_intake_iron
    food_intakes.pluck('iron').compact.sum
  end

  def activity_level_vitamin_c
    activity_levels.pluck('vitamin_c').compact.sum
  end

  def activity_level_vitamin_d3
    activity_levels.pluck('vitamin_d3').compact.sum
  end

  def activity_level_iron
    activity_levels.pluck('iron').compact.sum
  end

  def vitamin_c_diff
    food_intake_vitamin_c - activity_level_vitamin_c
  end

  def vitamin_d3_diff
    food_intake_vitamin_d3 - activity_level_vitamin_d3
  end

  def iron_diff
    food_intake_iron - activity_level_iron
  end

  private

  def food_intakes
    FoodIntake.for_date(current_user, object.created_at.all_day)
  end

  def activity_levels
    ActivityLevel.for_date(current_user, object.created_at.all_day)
  end

  def current_user
    object.user
  end
end
