require 'waiting/base_strategy'

module Waiting
  class ConstantWaitStrategy < BaseStrategy
    attr_accessor :interval

    def initialize
      @interval = 3
    end

    def wait
      sleep(@interval)
    end
  end
end
