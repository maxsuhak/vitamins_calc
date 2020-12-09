require 'rails_helper'

RSpec.describe ActivityLevelController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET index' do
    it 'returns a successful response' do
      get 'index'

      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    it 'renders the :new template' do
      get 'new'

      expect(response).to render_template('new')
    end
  end
end
