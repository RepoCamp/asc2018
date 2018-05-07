module Hyrax
  module Actors
    class IdentifierActor < Hyrax::Actors::AbstractActor
      ##
      # @see Hyrax::Actors::AbstractActor#create
      def create(env)
        env.attributes['identifier'] = [SecureRandom.uuid]
      end
    end
  end
end
