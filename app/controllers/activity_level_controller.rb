class ActivityLevelController < ApplicationController
  def index
    @activity_levels = ActivityLevel.todays(current_user)
  end

  def new
    @activity_level = ActivityLevel.new(user: current_user)
  end

  def create
    @activity_level = ActivityLevel.new(activity_level_params.merge(user: current_user))

    if @activity_level.save
      redirect_to activity_level_index_path, flash: { success: 'added activity level' }
    else
      flash.now[:error] = @activity_level.errors.full_messages.join(', ')
      render 'new'
    end
  rescue StandardError => e
    redirect_to root_path, flash: { error: e.message }
  end

  private

  def activity_level_params
    params.require(:activity_level).permit(%i[vitamin_c vitamin_d3 iron])
  end
end
