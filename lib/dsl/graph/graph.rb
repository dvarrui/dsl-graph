# frozen_string_literal: true

require_relative "edge"
require_relative "node"

module Dsl
  module Graph
    class Graph
      def initialize
        @next = { node: 0, edge: 0}
        @nodes = {}
        @edges = {}
      end

      def add_node(name)
        id = (@next[:node] += 1)
        node = Node.new(id, name)
        @nodes[id] = node
        node
      end

      def add_edge(node1, node2)
        id = (@next[:edge] += 1)
        edge = Edge.new(id, node1, node2)
        @edges[id] = edge
        edge
      end

      def run(&block)
        instance_eval(&block) 
        self
      end
    end
  end
end
