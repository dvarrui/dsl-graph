# frozen_string_literal: true
require "graphviz"

module Dsl::Graph
  class Export
    def self.to_png(graph, filename)
      g = GraphViz.new(:G, type: :digraph)
      graph.nodes.each { |id, n| g.add_nodes(n.name) }
      graph.edges.each { |id, e| g.add_edges(e.from.name, e.to.name, label: e.label) }
      g.output(png: filename)
    end
  end
end