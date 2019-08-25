require 'json'

module Metric
  class Extractor
    attr_reader :file

    def initialize(file)
      @file = file
    end
  end
end
