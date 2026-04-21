#!/usr/bin/env ruby
require_relative "../lib/dsl/graph"

puts "==> Create"

graph {
  n1 = add_node("Obiwan")
  n2 = add_node("Anakin")
  n3 = add_node("Yoda")

  add_edge(n1, n2, "maestro_de")
  add_edge(n3, n1, "maestro_de")
}

puts "==> Debug"
graph.debug