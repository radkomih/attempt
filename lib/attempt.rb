require 'waiting/strategies'

class Attempt
  include Waiting::Strategies

  VERSION = "0.1.0"

  attr_accessor :tries, :wait_strategy, :exceptions, :failure_callback

  def initialize(**options)
    @tries = options[:tries] || 3
    @wait_strategy = build(options[:wait_strategy] || :constant)
    @exceptions = options[:exceptions] || [StandardError]
    @failure_callback = options[:failure_callback] || Proc.new { raise }
  end

  def execute(**options)
    context = options[:context]

    yield if block_given?
  rescue *@exceptions => e
    @tries -= 1

    unless @tries.zero?
      @wait_strategy.wait
      retry
    end

    @failure_callback.call(e, context)
  end

  private

  def wait_strategy=(strategy)
    @wait_strategy = build(strategy)
  end
end
