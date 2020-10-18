require 'waiting/base_strategy'

module Waiting
  class ExponentialBackoffWaitStrategy < BaseStrategy
    attr_accessor :count

    def initialize
      @count = 0
    end

    def wait
      @count += 1

      sleep((@count ** 4) + 15 + (rand(30) * (@count + 1)))
    end
  end
end
