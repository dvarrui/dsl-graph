# frozen_string_literal: true

module Dsl::Graph
  class ExportGraph

    def self.to_pdf(graph, filename)
      require "graphviz"
      g = Graphviz::Graph.new(graph.name)
      nodes = {}
      graph.nodes.each do |k,v|
        nodes[v.name] = g.add_node(v.name)
      end

      graph.edges.each do |k,v|
        n1 = nodes[v.from.name]
        n2 = nodes[v.to.name]
        n1.connect(n2)
      end

      Graphviz::output(g, :path => filename)
    end
  end
end