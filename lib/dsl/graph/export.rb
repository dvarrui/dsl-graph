# frozen_string_literal: true
require "graphviz"

module Dsl::Graph
  class ExportGraph
    def initialize(graph, filename)
      @graph = graph
      @filename = filename
    end

    def call
      ext = File.extname(@filename.downcase)
      
      case ext
      when ".pdf"
        export_to_pdf
      when ".yaml"
        puts "==> export yaml"
      else
        warn "[ERROR] Unkown export format: (#{ext})"
        exit 1
      end
    end

    private

    def export_to_pdf
      graph = @graph
      filename = @filename
      viz = Graphviz::Graph.new(graph.label)
      nodes = {}
      graph.nodes.each do |k,v|
        nodes[v.label] = viz.add_node(v.label)
      end

      graph.edges.each do |k,v|
        n1 = nodes[v.from.label]
        n2 = nodes[v.to.label]
        n1.connect(n2)
      end

      Graphviz::output(viz, :path => filename)
    end
  end
end