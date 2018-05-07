require 'rails_helper'

RSpec.describe Work do
  subject(:work) { described_class.new(year: ['2018']) }

  it { expect(work).to have_attributes(year: a_collection_containing_exactly('2018')) }
end
