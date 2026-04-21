# frozen_string_literal: true

module Dsl::Graph
  class Node
    attr_reader :id
    attr_accessor :label
    
    def initialize(id, label)
      @id = id
      @label = label
      @metadata = {}
    end

    def to_s
      @label
    end

    def [](key)
      @metadata[key] || "NODATA"
    end
  
  end
end

