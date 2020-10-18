require 'waiting/base_strategy'

module Waiting
  class RandomWaitStrategy < BaseStrategy
    attr_accessor :interval

    def initialize
      @interval = 10
    end

    def wait
      sleep(rand(@interval))
    end
  end
end
