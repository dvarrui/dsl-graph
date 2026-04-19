# frozen_string_literal: true

require_relative "graph/graph"
require_relative "graph/version"
require "debug"

def graph(&block)
  $GRAPH ||= Dsl::Graph::Graph.new
  return $GRAPH if block.nil?

  $GRAPH.run(&block)
  $GRAPH
end
