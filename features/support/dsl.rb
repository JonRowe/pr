module DSL

  class World
    require 'pr'

    def run code
      eval code
    end
  end

  def define_form code
    world.run code
  end

  def fetch klass
    world.class.const_get klass
  end

  def world
    @world || World.new
  end

  def set thing, attribute, value
    thing.send "#{attribute}=", value
  end

end
World DSL
