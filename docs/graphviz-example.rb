#!/usr/bin/env ruby

require "graphviz"

#        Jedi
#    /     |    \
#  Yoda Obiwan Ankin

# Crear los nodos
graph = Graphviz::Graph.new("Jedi")

n0 = graph.add_node("Jedi")
n1 = graph.add_node("Yoda")
n2 = graph.add_node("Obiwan")
n3 = graph.add_node("Anakin")

# Conectar los nodos
e1 = n0.connect(n1)
e2 = n0.connect(n2)
e3 = n0.connect(n3)

# Crear pdf
Graphviz::output(graph, :path => "data/test.pdf")
