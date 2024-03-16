//###########################################################################################################
//# MODULO: practica.mod
//###########################################################################################################
//# DESCRIPCION: Definición del modelo de datos de resolución
//# de un problema de programación lineal para optimización de grafos
//# FECHA: 01/02/2024
//# AUTOR: Ramiro Bueno Martínez
//# COMENTARIOS: Master en IA en el sector de la Energía e Infraestructuras
//############################################################################################################
// Optimized Linear Programming (OLP) -  Actividad 2 - Apartado A

//Definicion de Variables
int NuNods=...;
// tupla origen destino coste
tuple arco
{
	key int o;
	key int d;
	int peso;
};
{arco} arcos=...;
{int} nodos={i.o | i in arcos} union {i.d | i in arcos};
int st=1; 		// Nodo Inicial del Camino Minimo
int en=5; 		// Nodo Final del Camino Minimo
dvar boolean x[arcos]; // Variables de decisión

//Funcion Objetivo
dexpr int fobj=sum(e in arcos) x[e]*e.peso; 
minimize fobj;
subject to
{
 
  forall(i in nodos)
    st_constraints:
    	sum(e in arcos:e.o==i) x[e] - sum(e in arcos:e.d==i) x[e]== ((i==st)?1:((i==en)?(-1):0));
  forall(_arco in arcos)
    st_nonegativity:
    	x[_arco] >= 0;	
} 
{arco} shortestPath= {e | e in arcos : x[e]==st};
execute
{
    writeln("Solución -> Coste total: ",fobj, "- Camino Minimo: ", shortestPath);
}
