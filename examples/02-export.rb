#!/usr/bin/env ruby
require_relative "../lib/dsl/graph"

graph do
  n1 = add_node("Obiwan")
  n2 = add_node("Anakin")
  n3 = add_node("Yoda")

  add_edge(n1, n2, "maestro_de")
  add_edge(n3, n1, "maestro_de")
end

filename = "data/02-graph.pdf"
puts "==> Exportando el grafo: #{filename}"
graph.export(output: filename)