require 'rails_helper'

RSpec.describe Hyrax::WorkForm do
  subject(:form) { described_class.new(work, ability, controller) }

  let(:ability)    { :none }
  let(:controller) { :none }
  let(:work)       { Work.new }
end
