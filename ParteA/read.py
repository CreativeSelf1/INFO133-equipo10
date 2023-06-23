import mariadb

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
        print("--------------------------------------")
    else:
        print("No se encontraron categorías para el medio de prensa:", nombre_medio_categoria)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    

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
            print(resultado[0])
        print("--------------------------------------")
    else:
        print("No se encontro el XPATH titulo para el medio de prensa:", titulo_xpath)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    
    
#CONSULTA NUMERO 3
info_medio  = input("Informacion medio, año fundacion, ciudad , fundador para el medio de prensa: ")

# Definir la consulta con un parámetro
consulta = """
SELECT mdp.nombre_prensa, año_fundacion, u.ciudad, f.nombre 
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
            
            print("Nombre del medio de prensa:", nombre_prensa)
            print("Año de fundación:", año_fundacion)
            print("Ciudad:", ciudad)
            print("Nombres de los fundadores:", fundadores)
            print("--------------------------------------")
    else:
        print("No se encontraron resultados para el XPATH título:", info_medio)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)


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
        print("--------------------------------------")
                
    else:
        print("No se encontraron resultados para el medio de prensa:", seguidores_medio)
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)


# Cerrar cursor y conexión
cursor.close()
conexion.close()
