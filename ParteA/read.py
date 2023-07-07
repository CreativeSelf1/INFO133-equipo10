import mariadb
import time
import requests
from bs4 import BeautifulSoup
import random
from requests_html import HTMLSession
import w3lib.html
import html

# Conectarse a la base de datos cambiando los datos de tu usuario y base creada
conexion = mariadb.connect(
    host="localhost",
    user="user",
    password="password",
    database="database"
)

cursor = conexion.cursor()

print("Consultas de datos")
print("--------------------------------------")

#CONSULTA NUMERO 1
nombre_medio_categoria = input("Categorias del medio: ")

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
print("Cantidad de noticias por categoría \n")

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

######################
##Parte de Crawling##
####################
print("Crawling \n")
nombre_medio = input("Ingrese el nombre del medio de prensa: ")
nombre_categoria = input("Ingrese el nombre de la categoría: ")

consulta = """
SELECT XPATH, url_categoria
FROM categoria
WHERE nombre = %s AND nombre_prensa = %s
"""
try:
    cursor.execute(consulta, (nombre_categoria, nombre_medio))
    resultado = cursor.fetchone()

    if resultado:
        xpath_categoria = resultado[0]
        url_categoria = resultado[1]
        print("XPath:", xpath_categoria)
        print("URL de la categoría:", url_categoria)
    else:
        url_categoria = None
        xpath_categoria = None
        print(f"No se encontró la categoría {nombre_categoria} en el medio de prensa {nombre_medio}.")
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    url_categoria = None


session = HTMLSession()

if(xpath_categoria is not None):
## Simular que estamos utilizando un navegador web
    USER_AGENT_LIST = [
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
            "Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24"
    ]
    headers = {'user-agent':random.choice(USER_AGENT_LIST) }
    response = session.get(url_categoria,headers=headers)

    xpath_url= xpath_categoria
    all_urls = response.html.xpath(xpath_url)

    for url in all_urls:
            article_url = url
            print(article_url)

    print(len(all_urls))
print("--------------------------------------")


######################
##Parte de Scrapping#
####################
print("Scrapping \n")
nombre_medio = input("Ingrese el nombre del medio de prensa: ")

consulta = """
SELECT url_noticia, XPATH_titulo 
FROM noticia n 
WHERE nombre_prensa = %s
"""
try:
    cursor.execute(consulta, (nombre_medio,))  # Agrega una coma después de nombre_medio
    resultado = cursor.fetchone()

    if resultado:
        url_noticia = resultado[0]
        XPATH_titulo = resultado[1]
        print("Noticia:", url_noticia)
        print("XPATH_titulo:", XPATH_titulo)
    else:
        url_noticia = None
        print(f"No se encontró la url de la noticia en el medio de prensa {nombre_medio}.")
except mariadb.Error as error:
    print("Error al ejecutar la consulta:", error)
    url_noticia = None

print("--------------------------------------")


session = HTMLSession()

if(url_noticia is not None):

    USER_AGENT_LIST = [
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
            "Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24"
    ]
    headers = {'user-agent':random.choice(USER_AGENT_LIST) }
    response = session.get(url_noticia,headers=headers)

    
    title = response.html.xpath(XPATH_titulo)[0].text
    print(title)
    
    #contents=response.html.xpath("//div[@class='entry-content']//p")
    #for content in contents:
    #       print(content.text)


# Cerrar cursor y conexión
cursor.close()
conexion.close()
