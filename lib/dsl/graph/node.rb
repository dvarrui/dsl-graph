# frozen_string_literal: true

module Dsl::Graph
  class Node
    attr_reader :id
    attr_accessor :label
    
    def initialize(id, label)
      @id = id
      @label = label
    end

    def to_s
      @label
    end
  end    
end

