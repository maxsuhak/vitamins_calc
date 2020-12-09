require 'rails_helper'

RSpec.shared_examples_for 'constants' do
  it 'RANGE' do
    expect(described_class).to have_constant(:RANGE)
  end

  it 'COLUMNS_TO_VALIDATE' do
    expect(described_class).to have_constant(:COLUMNS_TO_VALIDATE)
  end
end
