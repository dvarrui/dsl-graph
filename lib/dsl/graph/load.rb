
# frozen_string_literal: true

require "yaml"

module Dsl::Graph
  class LoadGraph
    def initialize(filename)
      @filename = filename
    end

    def call
      data = YAML.load_file(@filename)
      graph_data = data["graph"]

      graph = Graph.new(graph_data["label"])
      nodes_by_label = {}

      graph_data["nodes"].each do |node_data|
        label = node_data["label"]
        nodes_by_label[label] = graph.add_node(label)
      end

      graph_data["edges"].each do |edge_data|
        from_node = nodes_by_label[edge_data["from"]]
        to_node   = nodes_by_label[edge_data["to"]]
        label     = edge_data["label"]
        graph.add_edge(from_node, to_node, label)
      end

      graph
    end
  end
end