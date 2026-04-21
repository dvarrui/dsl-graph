# frozen_string_literal: true

require_relative "edge"
require_relative "node"
require_relative "export"

module Dsl
  module Graph
    class Graph
      attr_reader :label
      attr_reader :nodes
      attr_reader :edges

      def initialize(labelº="graph")
        @label = label
        @next = { node: 0, edge: 0}
        @nodes = {}
        @edges = {}
      end

      def add_node(label)
        id = (@next[:node] += 1)
        node = Node.new(id, label)
        @nodes[id] = node
        node
      end

      def add_edge(node1, node2, label)
        id = (@next[:edge] += 1)
        edge = Edge.new(id, node1, node2, label)
        @edges[id] = edge
        edge
      end

      def run(&block)
        instance_eval(&block) 
        self
      end

      def debug
        puts "graph (name: #{@label})"
        puts "> nodes (#{@nodes.size})"
        @nodes.each do |id, node|
          puts "  - node(#{node.id}): #{node} "
        end
        puts "> edges (#{@edges.size})"
        @edges.each do |id, edge| 
          puts "  - edge(#{edge.id}): #{edge.from} --(#{edge})--> #{edge.to}"
        end
      end

      def export(format: :pdf, output: 'graph')
        ExportGraph.to_pdf(self, output)
      end
    end
  end
end
