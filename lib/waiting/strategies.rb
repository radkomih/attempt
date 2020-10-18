require 'waiting/constant_wait_strategy'
require 'waiting/exponential_backoff_wait_strategy'
require 'waiting/incremental_wait_strategy'
require 'waiting/random_wait_strategy'

module Waiting
  module Strategies
    def build(type)
      strategy = case type
      when :constant
        ConstantWaitStrategy
      when :incremental
        IncrementalWaitStrategy
      when :random
        RandomWaitStrategy
      when :exponential
        ExponentialBackoffWaitStrategy
      else
        ConstantWaitStrategy
      end

      strategy.new
    end
  end
end
