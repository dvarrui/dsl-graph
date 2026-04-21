# Dsl::Graph

DSL para crear grafos.

## Instalación

* Instalar Ruby
* Instalar Graphviz: `sudo zypper install graphviz`
* `gem install dsl-graph`

## Modo de uso

Ejemplo:

```ruby
require "dsl/graph"

graph do
  n1 = add_node("Obiwan")
  n2 = add_node("Anakin")

  add_edge(n1, n2, "maestro_de")
end

graph.export("starwars.pdf")
```

> Consultar más [ejemplos](./examples/)

## Funciones disponibles

* Crear un grafo (nodos y aristas) a partir del DSL.
* Exportar (`export`) los datos a un YAML, o generar un gráfico en PDF.
* Cargar (`load`) datos desde un YAML.

Pendiente:

- Añadir metadatos a los nodos y aristas.
- Mostrar (`render`) el gráfico del grafo en pantalla.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvarrui/dsl-graph.
