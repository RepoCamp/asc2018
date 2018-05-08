class LoggingActor
  attr_reader :next_actor
  def initialize(next_actor=nil)
    @next_actor = next_actor
  end

  def create(env)
    return unless next_actor
    next_actor.singleton_class.include DecoratorLogic
    next_actor.create(env)
  end

  def update(env)
    return unless next_actor
    next_actor.singleton_class.include DecoratorLogic
    next_actor.update(env)
  end

  def destroy(env)
    return unless next_actor
    next_actor.singleton_class.include DecoratorLogic
    next_actor.destroy(env)
  end

  module DecoratorLogic
    def create(env)
      puts "Running create on #{self.class}"
      super.tap do |result|
        puts "#{self.class} returned false." if result == false
      end
    end

    def update(env)
      puts "Running update on #{self.class}"
      super.tap do |result|
        puts "#{self.class} returned false." if result == false
      end
    end

    def destroy(env)
      puts "Running destroy on #{self.class}"
      super.tap do |result|
        puts "#{self.class} returned false." if result == false
      end
    end

    def next_actor
      @real_next_actor ||=
        super.tap do |actor|
          actor.singleton_class.include DecoratorLogic
        end
    end
  end
end
