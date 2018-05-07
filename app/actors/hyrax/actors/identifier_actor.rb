module Hyrax
  module Actors
    class IdentifierActor < Hyrax::Actors::AbstractActor
      ##
      # @see Hyrax::Actors::AbstractActor#create
      def create(env)
        (env.attributes['identifier'] = [SecureRandom.uuid]) &&
          next_actor.create(env)
      end
    end
  end
end
