# frozen_string_literal: true

require_relative "graph/graph"
require_relative "graph/version"

module Dsl
  module Graph
    class Error < StandardError; end
    # Your code goes here...
  end
end

def graph
  $GRAPH ||= Graph.new
end
