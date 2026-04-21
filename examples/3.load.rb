#!/usr/bin/env ruby
require_relative "../lib/dsl/graph"

puts "==> Create"

g1 = graph "demo1" do
  n1 = add_node("Obiwan")
  n2 = add_node("Anakin")
  n3 = add_node("Yoda")

  add_edge(n1, n2, "maestro_de")
  add_edge(n3, n1, "maestro_de")
end

g1.debug
puts "==> Export"
g1.export("data/3-graph.yaml")

puts "==> Load"
g2 = graph.load("data/3-graph.yaml")
g2.label = "demo2"
g2.debug