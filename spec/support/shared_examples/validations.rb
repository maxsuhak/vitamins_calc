require 'rails_helper'

RSpec.shared_examples_for 'validations' do |range|
  it { is_expected.to allow_value(nil).for(:vitamin_c) }
  it { is_expected.to allow_value(nil).for(:vitamin_d3) }
  it { is_expected.to allow_value(nil).for(:iron) }

  it { should validate_inclusion_of(:vitamin_c).in_range(range) }
  it { should validate_inclusion_of(:vitamin_d3).in_range(range) }
  it { should validate_inclusion_of(:iron).in_range(range) }
end
