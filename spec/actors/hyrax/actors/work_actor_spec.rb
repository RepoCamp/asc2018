require 'rails_helper'

RSpec.describe Hyrax::Actors::WorkActor do
  subject(:actor)  { described_class.new(next_actor) }
  let(:ability)    { Ability.new(User.create(id: 'fake@exmaple.com')) }
  let(:attributes) { { title: [title] } }
  let(:next_actor) { Hyrax::Actors::Terminator.new }
  let(:env)        { Hyrax::Actors::Environment.new(work, ability, attributes) }
  let(:title)      { 'comet in moominland' }
  let(:work)       { Work.new }

  it 'casts titles to title case' do
    expect { actor.create(env) }
      .to change { work.title.to_a }
      .to a_collection_containing_exactly 'Comet In Moominland'
  end
end
