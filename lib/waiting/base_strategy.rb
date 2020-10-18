module Waiting
  class BaseStrategy
    def wait
      raise NotImplementedError
    end
  end
end
