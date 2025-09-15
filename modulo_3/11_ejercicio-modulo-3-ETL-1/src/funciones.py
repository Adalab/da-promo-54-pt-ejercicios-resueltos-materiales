# %%
# Librerías necesarias

import os
import pandas as pd
import numpy as np

# %%
def archivos():
    
    #Si al abrir el csv diera error porque no coinciden los números de columna:
    # on_bad_lines='skip' en la carga del df
    
    df1 = pd.read_csv('data/productos.csv', on_bad_lines='skip')
    df2 = pd.read_csv('data/clientes.csv', on_bad_lines='skip')
    df3 = pd.read_csv('data/ventas.csv', on_bad_lines='skip')
    
    return df1 , df2 , df3

def exploracion (df1 , df2 , df3):
    
    for df, nombre in zip([df1, df2, df3] , ['productos', 'clientes', 'ventas']):
        print(f"INFORMACIÓN SOBRE {nombre.upper()}")
        print(f"La forma:")
        print(f"{df.shape}\n")
        print(f"Las columnas:")
        print(f"{df.columns}\n")
        print(f"Los tipos de datos:")
        print(f"{df.dtypes}\n")
        print(f"Los nulos:")
        print(f"{df.isnull().sum()}\n")
        print(f"Los duplicados:")
        print(f"{df.duplicated().sum()}\n")
        print(f"Los principales estadísticos:")
        print(f"{df.describe().T}\n")
        # Sacamos la moda de las columnas categóricas sólo del df2 (clientes) porque es el que tiene nulos
        if nombre == 'clientes':
            print(f"Las modas de las columnas categóricas:\n")
            columnas_cat = df.select_dtypes(include = 'object')
            for columna in columnas_cat:
                if df[columna].isnull().any():
                    print(f"Revisando {columna}")
                    print(df[columna].value_counts())  
                    print("") 
        print(f"\n-----------------------------\n")
    
    return

def limpieza (df2,df1,df3):
    print("LIMPIEZA DE CLIENTES:")
    df2[["email", "gender", "Address"]] = df2[["email", "gender", "Address"]].fillna("unknown")
    df2["City"] = df2["City"].fillna("Madrid")
    df2["Country"]= df2["Country"].fillna("Spain")
    df2['full_name'] = df2['first_name'] + ' ' + df2['last_name']
    df2["City"] = df2["City"].apply(lambda x : x.replace("," , "") if isinstance(x , str) else x)
    df2["Address"] = df2["Address"].apply(lambda x : x.replace("," , "") if isinstance(x , str) else x)
    df1['ID_Producto'] = df1['ID']
    df3['id'] = df3['ID_Cliente']
    
    return df1, df2, df3

def union(df1,df2,df3):



    df_ventas_productos = pd.merge(df3, df1, on='ID_Producto', how='left')
    tabla_unica = pd.merge(df_ventas_productos, df2, on='id', how='left')
    #return tabla_unica
    return tabla_unica


def transformacion(tabla_unica):

    # Eliminar columnas innecesarias
    tabla_unica = tabla_unica.drop(columns=['first_name', 'last_name', 'ID', "id"])

    # Ordenar las columnas
    columnas_ordenadas = ['ID_Cliente', 'full_name', 'email', 'gender', 'City', 
                          'Country', 'Address', 'ID_Producto', 'Nombre_Producto', 
                          'Categoría', 'Origen', 'Descripción', 'Fecha_Venta', 
                          'Cantidad', 'Precio', 'Total']
    tabla_final = tabla_unica[columnas_ordenadas]

    # Cambiar nombre de columnas a español
    mapeo_columnas = {
        'ID_Cliente': 'ID Cliente',
        'full_name': 'Nombre completo',
        'email': 'Correo electrónico',
        'gender': 'Género',
        'City': 'Ciudad',
        'Country': 'País',
        'Address': 'Dirección',
        'ID_Producto': 'ID Producto',
        'Nombre_Producto': 'Nombre del producto',
        'Categoría': 'Categoría',
        'Origen': 'Origen',
        'Descripción': 'Descripción',
        'Fecha_Venta': 'Fecha de venta',
        'Cantidad': 'Cantidad',
        'Precio': 'Precio',
        'Total': 'Total'
    }
    tabla_final = tabla_final.rename(columns=mapeo_columnas)

    # Guardar el DataFrame en un archivo CSV en la carpeta data
    tabla_final.to_csv('data/tabla_final.csv', index=False)

    return tabla_final
