require 'rails_helper'

RSpec.describe Hyrax::Actors::IdentifierActor do
  subject(:actor)  { described_class.new(next_actor) }
  let(:ability)    { Ability.new(User.create(id: 'fake@example.com')) }
  let(:next_actor) { Hyrax::Actors::Terminator.new }
  let(:env)        { Hyrax::Actors::Environment.new(work, ability, {}) }
  let(:work)       { Work.new }

  it 'assigns an identifier' do
    expect { actor.create(env) }
      .to change { env.attributes['identifier'] }
      .to an_instance_of(String)
  end

  it 'can save with resulting attributes' do
    actor.create(env)

    expect(Work.new(env.attributes.merge(title: ['Comet in Moominland'])))
      .to be_valid
  end
end
