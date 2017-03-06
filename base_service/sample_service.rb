require_relative './base_service'

class SampleService < BaseService
  def initialize(args = {})
    @name = args[:name]
  end

  def run
    msg = first_step

    other_step(msg)
  end

  private

  def first_step
    "Hello #{@name}"
  end

  def other_step(msg)
    puts msg
  end
end

if __FILE__ == $PROGRAM_NAME
  name = ARGV[0] || 'World'
  SampleService.run(name: name) # => Hello World
end
