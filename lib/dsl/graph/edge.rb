# frozen_string_literal: true

module Dsl
  module Graph
    class Edge
      attr_reader :id
      attr_accessor :node1
      attr_accessor :node2
      attr_accessor :label
    
      def initialize(id, node1, node2, label="")
        @id = id
        @node1 = node1
        @node2 = node2
        @label = label
      end
    end    
  end
end

