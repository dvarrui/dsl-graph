# frozen_string_literal: true
require "graphviz"
require "yaml"
  
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
      when ".yaml", ".yml"
        export_to_yaml
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

    def export_to_yaml
      data = {
        "graph" => {
          "label" => @graph.label,
          "nodes" => @graph.nodes.values.map { |n| { "id" => n.id, "label" => n.label } },
          "edges" => @graph.edges.values.map do |e|
            {
              "id" => e.id,
              "from" => e.from.label,
              "label" => e.label,
              "to" => e.to.label
            }
          end
        }
      }
  
      File.write(@filename, data.to_yaml)
    end
  end
end