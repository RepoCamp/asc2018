require 'rails_helper'

RSpec.describe Hyrax::WorkForm do
  subject(:form) { described_class.new(work, ability, controller) }

  let(:ability)    { :none }
  let(:controller) { :none }
  let(:work)       { Work.new }

  it "has the expected terms" do
    expect(form.terms).to include(:title)
    expect(form.terms).to include(:year)
  end
end
