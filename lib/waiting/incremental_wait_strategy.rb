require 'waiting/base_strategy'

module Waiting
  class IncrementalWaitStrategy < BaseStrategy
    attr_accessor :interval, :increment

    def initialize
      @interval = 3
      @increment = 1
    end

    def wait
      sleep(@interval += @increment)
    end
  end
end
