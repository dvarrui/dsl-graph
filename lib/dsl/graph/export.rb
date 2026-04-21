# frozen_string_literal: true

module Dsl::Graph
  class ExportGraph

    def self.to_png(graph, filename)
      require "graphviz"

      g = Graphviz::Graph.new(:G, type: :digraph)
      graph.nodes.each { |id, n| g.add_node(n.name) }
      graph.edges.each { |id, e| g.connect(e.from.name, e.to.name, label: e.label) }
      g.output(png: filename)
    end
  end
end