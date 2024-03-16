#############################################################################################
# Titulo: shortestpath
#############################################################################################
#### Fecha: 10/01/2024
#### Autor: Ramiro Bueno Martínez
#############################################################################################
## MODULO: practica.mod: 
El presente proyecto, pretende abordar cuestiones relacionadas con la resolución de problemas de Programación Lineal, en el ambito de resolución de Grafos y el contexto de Optimización de Algoritmos basados en Sistemas de Inteligencia Artificial. El desarrollo del proyecto, se ha realizado a partir de la plantilla de ejemplo proporcionada en el entorno CPLEX, netflow y la información proporcionada por IBM acerca del algoritmo Shortestpath en su pagina web, que define la estructura básica para la resolución de problemas de optimización de flujos de red mediante dicho entorno de programación.  
## COMENTARIOS: 
Actividad en el contexto del Master en IA en el sector de la Energía e Infraestructuras.
Optimized Linear Programming (OLP) 
### Definicion de Variables:
NuNods: Variable que probablemente representa el número de nodos en el grafo. Se espera que sea definida en otro lugar del código.
edges: Conjunto de tuplas que representan los bordes del grafo, con información sobre origen, destino y peso.
nodes: Conjunto de nodos del grafo, que se construye a partir de los bordes.
st y en: Nodos inicial y final del camino mínimo que se desea encontrar.
x: Variables de decisión binarias que indican si un borde está incluido en el camino mínimo.
### Funcion Objetivo:
fobj: Expresión que calcula el costo total del camino mínimo, sumando los pesos de los bordes incluidos en el camino.
minimize fobj: La función objetivo del modelo es minimizar el costo total del camino mínimo.
### Restricciones:

subject to:
forall(i in nodes) st_constraints: Restricciones que garantizan que para cada nodo, la suma de las variables de los bordes que salen menos la suma de las variables de los bordes que entran sea igual a 1 si es el nodo inicial, -1 si es el nodo final o 0 en otros casos.
forall(_edge in edges) st_nonegativity: Restricciones que garantizan que todas las variables de decisión sean no negativas.
shortestPath: Conjunto que contiene los bordes que forman parte del camino mínimo.
### Presentación de Resultados:
execute:
Imprime la solución encontrada, mostrando el costo total del camino mínimo y el camino mínimo en sí.

## RESULTADOS:

// solution (optimal) with objective 9
Solución -> Coste total: 9- Camino Minimo:  {<1 2 1> <2 3 2> <3 5 6>}

