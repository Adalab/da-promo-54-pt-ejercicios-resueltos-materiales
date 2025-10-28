#%%
from src import funciones as fun

#%%
productos, clientes, ventas = fun.archivos()

fun.exploracion(productos, clientes, ventas)

#%%
productos_limpio, clientes_limpio, ventas_limpio = fun.limpieza(clientes,productos,ventas)

#%%
tabla_unica = fun.union(productos, clientes, ventas)

tabla_final = fun.transformacion(tabla_unica)


# %%
