# frozen_string_literal: true

require_relative "edge"
require_relative "node"

module Dsl
  module Graph
    class Graph
      def initialize
        @next = { node_id: 0, edge_id: 0}
        @nodes = {}
        @edges = {}
      end

      def add_node(name)
        id = (@next[:node_id] += 1)
        node = Node.new(id, name)
        @nodes[id] = node
        node
      end

      def run(&block)
        instance_eval(&block) 
        self
      end
    end
  end
end
