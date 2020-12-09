class FoodIntakeController < ApplicationController
  def index
    @food_intakes = FoodIntake.todays(current_user)
  end

  def new
    @food_intake = FoodIntake.new(user: current_user)
  end

  def create
    @food_intake = FoodIntake.new(food_intake_params.merge(user: current_user))

    if @food_intake.save
      redirect_to food_intake_index_path, flash: { success: 'added food intake' }
    else
      flash.now[:error] = @food_intake.errors.full_messages.join(', ')
      render 'new'
    end
  rescue StandardError => e
    redirect_to root_path, flash: { error: e.message }
  end

  private

  def food_intake_params
    params.require(:food_intake).permit(%i[vitamin_c vitamin_d3 iron])
  end
end
