require 'rails_helper'

RSpec.describe ActivityLevel, type: :model do
  it { should belong_to(:user) }

  it_behaves_like 'constants'
  it_behaves_like 'validations', 1..3
end
