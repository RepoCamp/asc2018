require 'rails_helper'

RSpec.describe Hyrax::Actors::WorkActor do
  subject(:actor)  { described_class.new(next_actor) }
  let(:next_actor) { Hyrax::Actors::Terminator.new }
end
