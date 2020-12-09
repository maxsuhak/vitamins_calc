require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET index' do
    it 'returns a successful response' do
      get 'index'

      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    before do
      create(:activity_level, user: user)
      create(:food_intake, user: user)
    end

    it 'creates recipe' do
      post 'create'

      expect(controller).to set_flash[:success]
      expect(response).to redirect_to(recipes_path)
    end
  end

  describe 'GET show' do
    before do
      create(:activity_level, user: user, vitamin_c: 1, vitamin_d3: 1, iron: 1)
      create(:food_intake, user: user, vitamin_c: 4, vitamin_d3: 4, iron: 4)

      post 'create'
    end

    it 'returns a successful response' do
      get 'show', params: { id: user.recipes.last.id }, format: :html

      expect(response).to be_successful
    end

    it 'render template' do
      get 'show', params: { id: user.recipes.last.id }, format: :html

      expect(subject).to render_template(:show)
    end

    it 'returns json' do
      get 'show', params: { id: user.recipes.last.id }, format: :json

      expect(json).to include_json(
        vitamin_c: 7,
        vitamin_d3: 7,
        iron: 7,
        food_intake_vitamin_c: 4,
        food_intake_vitamin_d3: 4,
        food_intake_iron: 4,
        activity_level_vitamin_c: 1,
        activity_level_vitamin_d3: 1,
        activity_level_iron: 1,
        vitamin_c_diff: 3,
        vitamin_d3_diff: 3,
        iron_diff: 3
      )
    end
  end
end
