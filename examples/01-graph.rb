#!/usr/bin/env ruby
require_relative "../lib/dsl/graph"

def graph
  $GRAPH ||= Graph.new
end

g = graph
puts g