#!/usr/bin/env ruby
require_relative "../lib/dsl/graph"

graph do
  puts "Creando el grafo"
  n1 = add_node("obiwan")
  n2 = add_node("anakin")
  e1 = add_edge(n1, n2)

  puts n1.inspect
  puts n2.inspect
  puts e1.inspect
end