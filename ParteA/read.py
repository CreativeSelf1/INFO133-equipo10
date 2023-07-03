import mariadb
import time
import requests
from bs4 import BeautifulSoup
# Conectarse a la base de datos
conexion = mariadb.connect(
    host="localhost",
    user="fernando",
    password="fernando0607",
    database="medios_prensa"
)

# Crear cursor para ejecutar consultas
cursor = conexion.cursor()

print("Consultas de datos")
print("--------------------------------------")

#CONSULTA NUMERO 1
nombre_medio_categoria = input("Categorias del medio: ")

# Definir la consulta con un parámetro
consulta = """
SELECT nombre 
FROM categoria c
JOIN medios_de_prensa mdp 
ON c.nombre_prensa = mdp.nombre_prensa 
WHERE mdp.nombre_prensa = %s
"""
try:
    # Ejecutar la consulta con el parámetro
    cursor.execute(consulta, (nombre_medio_categoria,))

    # Obtener todos los resultados
    resultados = cursor.fetchall()

    if resultados:
        for resultado in resultados:
            print(resultado[0])
    else:
        print("No se encontraron categorías para el medio de prensa: ", nombre_medio_categoria)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    
print("--------------------------------------")

#CONSULTA NUMERO 2
titulo_xpath  = input("XPATH titulo de la noticia del medio: ")

# Definir la consulta con un parámetro
consulta = """
SELECT XPATH_titulo 
FROM noticia n 
JOIN medios_de_prensa mdp 
ON n.nombre_prensa = mdp.nombre_prensa 
WHERE mdp.nombre_prensa = %s
"""
try:
    # Ejecutar la consulta con el parámetro
    cursor.execute(consulta, (titulo_xpath,))

    # Obtener todos los resultados
    resultados = cursor.fetchall()

    if resultados:
        for resultado in resultados:
            if resultado[0] is not None:
                print(resultado[0])
            else:
                print("Desconocido")
    else:
        print("No se encontró el XPATH título para el medio de prensa:", titulo_xpath)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    
print("--------------------------------------")
    
#CONSULTA NUMERO 3
info_medio  = input("Informacion medio, año fundacion, ciudad , fundador para el medio de prensa: ")

# Definir la consulta con un parámetro
consulta = """
SELECT mdp.nombre_prensa, año_fundacion, u.ciudad, f.nombre, f.apellido
FROM medios_de_prensa mdp 
JOIN ubicacion u 
ON u.ID_ubicacion = mdp.ID_ubicacion 
JOIN fundadores f 
ON f.nombre_prensa = mdp.nombre_prensa 
WHERE mdp.nombre_prensa = %s
"""
try:
    # Ejecutar la consulta con el parámetro
    cursor.execute(consulta, (info_medio,))

    # Obtener todos los resultados
    resultados = cursor.fetchall()

    if resultados:
        for resultado in resultados:
            nombre_prensa = resultado[0]
            año_fundacion = resultado[1]
            ciudad = resultado[2]
            fundadores = resultado[3]
            apellido = resultado[4]
            
            print("Nombre del medio de prensa:", nombre_prensa)
            if resultado[1] is not None:
                print("Año de fundación:", año_fundacion)
            else:
                print("Año de fundacion: Desconocido")
            print("Ciudad:", ciudad)
            if resultado[4] is not None:
                print("Nombres de los fundadores:", fundadores, apellido)
            else:
                print("Nombres de los fundadores: Desconocido")
    else:
        print("No se encontraron resultados para el XPATH título:", info_medio)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)

print("--------------------------------------")

#CONSULTA NUMERO 4
seguidores_medio = input("Cantidad de seguidores del medio en redes sociales: ")

consulta = """
SELECT mdp.nombre_prensa, SUM(rs.numero_seguidores) 
FROM medios_de_prensa mdp 
JOIN redes_sociales rs 
ON rs.nombre_prensa = mdp.nombre_prensa 
WHERE rs.nombre_prensa = %s 
GROUP BY mdp.nombre_prensa
"""
try:
    # Ejecutar la consulta con el parámetro
    cursor.execute(consulta, (seguidores_medio,))

    # Obtener el resultado
    resultado = cursor.fetchone()

    if resultado:
        nombre_prensa = resultado[0]
        total_seguidores = resultado[1]
            
        print("Nombre del medio de prensa:", nombre_prensa)
        print("Total de seguidores:", total_seguidores)
                
    else:
        print("No se encontraron resultados para el medio de prensa: ", seguidores_medio)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)

print("--------------------------------------")


#consulta 5
time.sleep(2)
print("Cantidad de noticias por cateogoría \n")

consulta = """
SELECT c.nombre , count(url_noticia)
FROM noticia n 
JOIN categoria c 
ON n.url_categoria = c.url_categoria 
GROUP BY c.nombre 
"""

try:
    # Ejecutar la consulta
    cursor.execute(consulta)

    # Obtener todos los resultados
    resultados = cursor.fetchall()

    # Imprimir los resultados
    for categoria, cantidad_noticias in resultados:
        print(categoria,cantidad_noticias)
    
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    
print("--------------------------------------")

# Parte de Crawling
print("Crawling \n")
nombre_medio = input("Ingrese el nombre del medio de prensa: ")
nombre_categoria = input("Ingrese el nombre de la categoría: ")

consulta = """
SELECT url_categoria
FROM categoria
WHERE nombre = %s AND nombre_prensa = %s
"""
try:
    cursor.execute(consulta, (nombre_categoria, nombre_medio))
    resultado = cursor.fetchone()

    if resultado:
        url_categoria = resultado[0]
        # print(url_categoria)

        response = requests.get(url_categoria)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, "html.parser")

            articulos = soup.find_all("article")
            enlaces_noticias = []

            for articulo in articulos:
                enlace = articulo.find("a", href=True)
                if enlace:
                    enlaces_noticias.append(enlace["href"])

            # Imprimir los enlaces encontrados
            print(f"Enlaces de la categoría {nombre_categoria} en {nombre_medio}:")
            for enlace in enlaces_noticias:
                print(enlace)
        else:
            print(f"No se pudo acceder a la categoría {nombre_categoria} en {nombre_medio}.")
    else:
        print(f"No se encontró la categoría {nombre_categoria} en el medio de prensa {nombre_medio}.")
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)

print("--------------------------------------")

# Cerrar cursor y conexión
cursor.close()
conexion.close()