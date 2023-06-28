import mariadb
import uuid


# Establecer la conexión con la base de datos
try:
    conn = mariadb.connect(
        user="fernando",
        password="fernando0607",
        host="localhost",
        port=3306,
        database="medios_prensa"  # Reemplaza con el nombre de tu base de datos
    )
    cursor = conn.cursor()
except mariadb.Error as e:
    print(f"Error al conectarse a la base de datos: {e}")
    exit()

# Generar UUIDs
ID_ubicacion = str(uuid.uuid4())
ID_cuenta = str(uuid.uuid4())
ID_fundador = str(uuid.uuid4())

# Ingresar datos para la tabla `ubicacion`
#ID_ubicacion = input("Ingresa el ID de ubicación: ")
ciudad = input("Ingresa el nombre de la ciudad: ")
region = input("Ingresa el nombre de la región: ")
pais = "Paraguay"
continente = "América"
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

año_fundacion = año_fundacion if año_fundacion.strip() else None

# Insertar datos en la tabla `medios_de_prensa`
cursor.execute(
    "INSERT INTO medios_de_prensa (nombre_prensa, año_fundacion, cobertura, url_principal, ID_ubicacion) VALUES (?, ?, ?, ?, ?)",
    (nombre_prensa, año_fundacion, cobertura, url_principal, ID_ubicacion)
)
conn.commit()


# Ingresar datos para la tabla `redes_sociales`
num_redes_sociales = int(input("Ingresa el número de redes_sociales: "))

for i in range(num_redes_sociales):
    #ID_cuenta = input("Ingresa el ID de la cuenta de redes sociales: ")
    numero_red_social = int(input("Ingresa el número correspondiente a la red social 1:Instagram  2:Facebook  3:Twitter  4:otro  :"))

    if numero_red_social == 1:
        aplicacion = "instagram"
    elif numero_red_social == 2:
        aplicacion = "facebook"
    elif numero_red_social == 3:
        aplicacion = "twitter"
    elif numero_red_social == 4:
        aplicacion = "otro"
    else:
        print("Número de red social no válido")
        
    usuario = input("Ingresa el usuario de la aplicación: ")
    numero_seguidores = input("Ingresa el número de seguidores: ")
    fec_ultima_actualizacion = input("Ingresa la fecha de última actualización: ")

    # Insertar datos en la tabla `redes_sociales`
    cursor.execute(
        "INSERT INTO redes_sociales (ID_cuenta, numero_seguidores, aplicacion, fec_ultima_actualizacion, nombre_prensa, usuario) VALUES (?, ?, ?, ?, ?, ?)",
        (ID_cuenta, numero_seguidores, aplicacion, fec_ultima_actualizacion, nombre_prensa, usuario)
    )
    ID_cuenta = str(uuid.uuid4())
    conn.commit()


# Ingresar datos para la tabla `fundadores`
num_fundadores = int(input("Ingresa el número de fundadores: "))

for i in range(num_fundadores):
    #ID_fundador = input("Ingresa el ID del fundador: ")
    nombre = input("Ingresa el nombre del fundador: ")
    apellido = input("Ingresa el apellido del fundador: ")
    
    nombre = nombre if nombre.strip() else None
    apellido = apellido if apellido.strip() else None

    # Insertar datos en la tabla `fundadores` con el ID del medio de prensa correspondiente
    cursor.execute(
        "INSERT INTO fundadores (ID_fundador, nombre, apellido, nombre_prensa) VALUES (?, ?, ?, ?)",
        (ID_fundador, nombre, apellido, nombre_prensa)
    )
    ID_fundador = str(uuid.uuid4())
    conn.commit()



# Ingresar datos para la tabla `categoria`
cantidad_categorias = int(input("Ingresa el número de categorias: "))

for i in range(cantidad_categorias):
    url_categoria = input("Ingresa la URL de la categoría: ")
    nombre_categoria = input("Ingresa el nombre de la categoría: ")
    XPATH = input("Ingresa el XPATH: ")

    XPATH = XPATH if XPATH.strip() else None
    # Insertar datos en la tabla `categoria`

    cursor.execute(
        "INSERT INTO categoria (url_categoria, nombre, XPATH, nombre_prensa) VALUES (?, ?, ?, ?)",
        (url_categoria, nombre_categoria, XPATH, nombre_prensa)
    )
    conn.commit()

# Ingresar datos para la tabla `noticia`
url_categoria = input("Ingresa la URL de la categoría de la noticia: ")
url_noticia = input("Ingresa la URL de la noticia: ")
XPATH_fecha = input("Ingresa el XPATH de la fecha: ")
XPATH_titulo = input("Ingresa el XPATH del título: ")
XPATH_contenido = input("Ingresa el XPATH del contenido: ")


XPATH_fecha = XPATH_fecha if XPATH_fecha.strip() else None
XPATH_titulo = XPATH_titulo if XPATH_titulo.strip() else None
XPATH_contenido = XPATH_contenido if XPATH_contenido.strip() else None


# Insertar datos en la tabla `noticia`
cursor.execute(
    "INSERT INTO noticia (url_noticia, XPATH_fecha, XPATH_titulo, XPATH_contenido, url_categoria, nombre_prensa) VALUES (?, ?, ?, ?, ?, ?)",
    (url_noticia, XPATH_fecha, XPATH_titulo, XPATH_contenido, url_categoria, nombre_prensa)
)
conn.commit()

# Cierra la conexión con la base de datos
conn.close()
