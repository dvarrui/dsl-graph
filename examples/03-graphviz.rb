#!/usr/bin/env ruby

require "graphviz"

#        Jedi
#    /     |    \
#  Yoda Obiwan Ankin

# Crear los nodos
jedi = Graphviz::Graph.new("Jedi")
nodes = []
nodes[0] = jedi.add_node("Yoda")
nodes[1] = jedi.add_node("Obiwan")
nodes[2] = jedi.add_node("Anakin")

# Conectar los nodos
edge1 = jedi.connect(nodes[0])
edge2 = jedi.connect(nodes[1])
edge3 = jedi.connect(nodes[2])

# Crear pdf
Graphviz::output(jedi, :path => "data/test.pdf")
