import mariadb

# Establecer la conexión con la base de datos
try:
    conn = mariadb.connect(
        user="usuario",
        password="constraseña",
        host="localhost",
        port=3306,
        database="nombre_basedatos"  # Reemplaza con el nombre de tu base de datos
    )
    cursor = conn.cursor()
except mariadb.Error as e:
    print(f"Error al conectarse a la base de datos: {e}")
    exit()

# Ingresar datos para la tabla `ubicacion`
ID_ubicacion = input("Ingresa el ID de ubicación: ")
ciudad = input("Ingresa el nombre de la ciudad: ")
region = input("Ingresa el nombre de la región: ")
pais = input("Ingresa el nombre del país: ")
continente = input("Ingresa el nombre del continente: ")

# Insertar datos en la tabla `ubicacion`
cursor.execute(
    "INSERT INTO ubicacion (ID_ubicacion, ciudad, region, pais, continente) VALUES (?, ?, ?, ?, ?)",
    (ID_ubicacion, ciudad, region, pais, continente)
)
conn.commit()
# Ingresar datos para la tabla `medios_de_prensa`
nombre_prensa = input("Ingresa el nombre del medio de prensa: ")
año_fundacion = input("Ingresa el año de fundación: ")
cobertura = input("Ingresa la cobertura: ")
url_principal = input("Ingresa la URL principal: ")

# Insertar datos en la tabla `medios_de_prensa`
cursor.execute(
    "INSERT INTO medios_de_prensa (nombre_prensa, año_fundacion, cobertura, url_principal, ID_ubicacion) VALUES (?, ?, ?, ?, ?)",
    (nombre_prensa, año_fundacion, cobertura, url_principal, ID_ubicacion)
)
conn.commit()

# Ingresar datos para la tabla `redes_sociales`
ID_cuenta = input("Ingresa el ID de la cuenta de redes sociales: ")
numero_seguidores = input("Ingresa el número de seguidores: ")
aplicacion = input("Ingresa el nombre de la aplicación: ")
fec_ultima_actualizacion = input("Ingresa la fecha de última actualización: ")

# Insertar datos en la tabla `redes_sociales`
cursor.execute(
    "INSERT INTO redes_sociales (ID_cuenta, numero_seguidores, aplicacion, fec_ultima_actualizacion, nombre_prensa) VALUES (?, ?, ?, ?, ?)",
    (ID_cuenta, numero_seguidores, aplicacion, fec_ultima_actualizacion, nombre_prensa)
)
conn.commit()

# Ingresar datos para la tabla `fundadores`
ID_fundador = input("Ingresa el ID del fundador: ")
nombre = input("Ingresa el nombre del fundador: ")
apellido = input("Ingresa el apellido del fundador: ")

# Insertar datos en la tabla `fundadores`
cursor.execute(
    "INSERT INTO fundadores (ID_fundador, nombre, apellido, nombre_prensa) VALUES (?, ?, ?, ?)",
    (ID_fundador, nombre, apellido, nombre_prensa)
)
conn.commit()

# Ingresar datos para la tabla `categoria`
url_categoria = input("Ingresa la URL de la categoría: ")
nombre_categoria = input("Ingresa el nombre de la categoría: ")
XPATH = input("Ingresa el XPATH: ")

# Insertar datos en la tabla `categoria`
cursor.execute(
    "INSERT INTO categoria (url_categoria, nombre, XPATH, nombre_prensa) VALUES (?, ?, ?, ?)",
    (url_categoria, nombre_categoria, XPATH, nombre_prensa)
)
conn.commit()

# Ingresar datos para la tabla `noticia`
url_noticia = input("Ingresa la URL de la noticia: ")
XPATH_fecha = input("Ingresa el XPATH de la fecha: ")
XPATH_titulo = input("Ingresa el XPATH del título: ")
XPATH_contenido = input("Ingresa el XPATH del contenido: ")


# Insertar datos en la tabla `noticia`
cursor.execute(
    "INSERT INTO noticia (url_noticia, XPATH_fecha, XPATH_titulo, XPATH_contenido, url_categoria, nombre_prensa) VALUES (?, ?, ?, ?, ?, ?)",
    (url_noticia, XPATH_fecha, XPATH_titulo, XPATH_contenido, url_categoria, nombre_prensa)
)
conn.commit()

# Cierra la conexión con la base de datos
conn.close()
