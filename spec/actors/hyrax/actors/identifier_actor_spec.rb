require 'rails_helper'

RSpec.describe Hyrax::Actors::IdentifierActor do
  subject(:actor)  { described_class.new(next_actor) }
  let(:ability)    { Ability.new(User.create(id: 'fake@example.com')) }
  let(:next_actor) { spy_actor_class.new }
  let(:env)        { Hyrax::Actors::Environment.new(work, ability, {}) }
  let(:work)       { Work.new }

  let(:spy_actor_class) do
    Class.new do
      attr_accessor :created

      def create(_env)
        self.created = true
      end
    end
  end

  it 'assigns an identifier' do
    expect { actor.create(env) }
      .to change { env.attributes['identifier'] }
      .to a_collection_containing_exactly(an_instance_of(String))
  end

  it 'can save with resulting attributes' do
    actor.create(env)

    expect(Work.new(env.attributes.merge(title: ['Comet in Moominland'])))
      .to be_valid
  end

  it 'calls create on next actor' do
    expect { actor.create(env) }
      .to change { next_actor.created }
      .to true
  end
end
